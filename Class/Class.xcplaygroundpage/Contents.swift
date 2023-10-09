import Foundation

print ("\n", "#1", "\n")

class Book {
    static var uniqueIDCounter = 0
    
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = Book.getNextUniqueID()
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    func markAsBorrowed() {
        isBorrowed = true
    }
    func markAsReturned() {
        isBorrowed = false
    }
    private static func getNextUniqueID() -> Int {
        uniqueIDCounter += 1
        return uniqueIDCounter
    }
}

class Owner {
    static var uniqueIDCounter = 0
    
    
    let ownerID: Int
    let name: String
    var borrowedBooks: [Book]
    
    init(ownerID: Int, name: String, borrowedBooks: [Book]) {
        self.ownerID = Owner.getNextUniqueID()
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    func borrowBookFromLibrary(_ book: Book, _ library: Library) {
        
        if library.letOwnertoBorrow(book) == true {
            borrowedBooks.append(book)
            book.markAsBorrowed()
            return
        }
    }
    func returnBookToLibrary(_ book: Book) {
        borrowedBooks.removeAll { $0 === book }
        book.markAsReturned()
    }
    private static func getNextUniqueID() -> Int {
        uniqueIDCounter += 1
        return uniqueIDCounter
    }
}

class Library {
    var booksArray: [Book]
    var ownersArray: [Owner]
    
    init(booksArray: [Book], ownersArray: [Owner]) {
        self.booksArray = booksArray
        self.ownersArray = ownersArray
    }
    
    func addBooksInLibrary(_ book: Book) { booksArray.append(book) }
    func addOwnersInLibrary(_ ownersName: Owner) { ownersArray.append(ownersName) }
    func findAwailableBooks() -> [Book] { booksArray.filter { !$0.isBorrowed } }
    func findBorrowedBooks() -> [Book] { booksArray.filter { $0.isBorrowed } }
    func findOwnerById(id: Int) -> [Owner] { ownersArray.filter { $0.ownerID == id } }
    func booksBorrowedBy(_ ownersName: Owner) -> [Book] { ownersName.borrowedBooks }
    func letOwnertoBorrow(_ book: Book) -> Bool { !book.isBorrowed }
}

let myLibrary = Library(booksArray: [], ownersArray: [])

let theRunningGrave = Book(bookID: 1, title: "THE RUNNING GRAVE", author: "Robert Galbraith", isBorrowed: false)
let theArmorOfLight = Book(bookID: 2, title: "THE ARMOR OF LIGHT", author: "Ken Follett", isBorrowed: false)
let fourthWing = Book(bookID: 3, title: "FOURTH WING", author: "Rebecca Yarros", isBorrowed: false)
let monthsToLove = Book(bookID: 4, title: "12 MONTHS TO LIVE", author: "James Patterson", isBorrowed: false)

let tengizi = Owner(ownerID: 111, name: "Tengo", borrowedBooks: [])
let darejani = Owner(ownerID: 222, name: "Daro", borrowedBooks: [])
let joao = Owner(ownerID: 333, name: "Joao", borrowedBooks: [])

myLibrary.addBooksInLibrary(theRunningGrave)
myLibrary.addBooksInLibrary(theArmorOfLight)
myLibrary.addBooksInLibrary(fourthWing)
myLibrary.addBooksInLibrary(monthsToLove)

myLibrary.addOwnersInLibrary(tengizi)
myLibrary.addOwnersInLibrary(darejani)
myLibrary.addOwnersInLibrary(joao)

tengizi.borrowBookFromLibrary(theRunningGrave, myLibrary)
joao.borrowBookFromLibrary(theRunningGrave, myLibrary)
darejani.borrowBookFromLibrary(fourthWing, myLibrary)
darejani.borrowBookFromLibrary(monthsToLove, myLibrary)
tengizi.returnBookToLibrary(theRunningGrave)
joao.borrowBookFromLibrary(theRunningGrave, myLibrary)

func printBorrowedBooks(_ library: Library) {
    let borrowedBooks = library.findBorrowedBooks()
    if borrowedBooks.isEmpty {
        print("No books are currently borrowed.")
    } else {
        print("Borrowed Books:")
        for book in borrowedBooks {
            print("Title: \(book.title), Author: \(book.author)")
        }
    }
}

func printavailableBooks(_ library: Library) {
    let availableBooks = library.findAwailableBooks()
    if availableBooks.isEmpty {
        print("No books are currently available.")
    } else {
        print("Available Books:")
        for book in availableBooks {
            print("Title: \(book.title), Author: \(book.author)")
        }
    }
}

func printBooksBorrowedByOwner(_ library: Library, _ owner: Owner) {
    let borrowedBooks = library.booksBorrowedBy(owner)
    if borrowedBooks.isEmpty {
        print("\(owner.name) has not borrowed any book")
    } else {
        print("\(owner.name) has borrowed Books:")
        for book in borrowedBooks {
            print("Title: \(book.title), Author: \(book.author)")
        }
    }
}

printBorrowedBooks(myLibrary)
printavailableBooks(myLibrary)
printBooksBorrowedByOwner(myLibrary, joao)

print ("\n", "#2", "\n")

class Product {
    static var uniqueIDCounter = 0
    
    let productID: Int
    let name: String
    var price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = Product.getNextUniqueID()
        self.name = name
        self.price = price
    }
    
    private static func getNextUniqueID() -> Int {
        uniqueIDCounter += 1
        return uniqueIDCounter
    }
}

class Cart {
    static var uniqueIDCounter = 0
    
    let cartID: Int
    var items: [Product]
    
    init(cartID: Int, items: [Product]) {
        self.cartID = Cart.getNextUniqueID()
        self.items = items
    }
    
    private static func getNextUniqueID() -> Int {
        uniqueIDCounter += 1
        return uniqueIDCounter
    }
    
    func addItemsInMyCart(_ item: Product) {
        items.append(item)
    }
    
    func removeItemFromMyCart(_ itemID: Int) {
        for (index, item) in items.enumerated() {
            if item.productID == itemID {
                items.remove(at: index)
                break
            }
        }
    }
    
    func calculateTotalPrice() -> Double {
        var totalPrice = 0.0
        for item in items {
            totalPrice += item.price
        }
        return totalPrice
    }
}

class User {
    static var uniqueIDCounter = 0
    
    let userID: Int
    let username: String
    var cart: Cart
    
    init(userID: Int, username: String, cart: Cart) {
        self.userID = User.getNextUniqueID()
        self.username = username
        self.cart = cart
    }
    
    func addProductToCart(_ product: Product) {
        cart.addItemsInMyCart(product)
    }
    
    func removeProductFromCart(_ productID: Int) {
        cart.removeItemFromMyCart(productID)
    }
    
    func checkout() -> Double {
        let totalPrice = cart.calculateTotalPrice()
        cart.items.removeAll()
        return totalPrice
    }
    
    private static func getNextUniqueID() -> Int {
        uniqueIDCounter += 1
        return uniqueIDCounter
    }
}

let gogitasCart = Cart(cartID: 1, items: [])
let marinesCart = Cart(cartID: 2, items: [])


let gogita = User(userID: 1, username: "Gogi", cart: gogitasCart)
let marine = User(userID: 2, username: "Mako", cart: marinesCart)

let product1 = Product(productID: 1, name: "Macivari", price: 890.0)
let product2 = Product(productID: 2, name: "Uto", price: 210.0)
let product3 = Product(productID: 3, name: "TV", price: 2048.0)

gogita.addProductToCart(product1)
marine.addProductToCart(product2)
marine.addProductToCart(product2)
marine.addProductToCart(product3)

print("\(gogita.username)'s items - ")
for item in gogita.cart.items {
    print("\(item.name) price is - \(item.price)")
}

print("\n \(marine.username)'s items - ")
for item in marine.cart.items {
    print("\(item.name) price is - \(item.price)")
}

print("\n \(gogita.username)'s total price - \(gogita.checkout())")
print("\n \(marine.username)'s total price - \(marine.checkout())")
