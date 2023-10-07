import Foundation

print ("\n", "#1", "\n")
/*
 შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.
 */

enum DayOfWeek {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

func isWeekend(day: DayOfWeek) -> Bool {
    switch day {
    case .Saturday, .Sunday:
        return true
    default:
        return false
    }
}

let today = DayOfWeek.Saturday
let isTodayWeekend = isWeekend(day: today)
print("Is today a weekend day? \(isTodayWeekend)")

print ("\n", "#2", "\n")
/*
 შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
 */

enum Weather {
    case Sunny(temperature: Double)
    case Cloudy(temperature: Double)
    case Rainy(temperature: Double)
    case Snowy(temperature: Double)
    
    func clothingRecommendation() -> String {
        switch self {
        case .Sunny(let temperature):
            if temperature > 25 {
                return "Wear sunscreen and light clothing."
            } else {
                return "Wear sunglasses and bring a hat."
            }
        case .Cloudy(let temperature):
            if temperature > 20 {
                return "A light jacket might be a good idea."
            } else {
                return "Carry an umbrella just in case."
            }
        case .Rainy:
            return "Don't forget your raincoat and umbrella."
        case .Snowy(let temperature):
            if temperature < 0 {
                return "Bundle up in warm layers and wear snow boots."
            } else {
                return "Wear a warm coat and gloves."
            }
        }
    }
}

let sunnyWeather = Weather.Sunny(temperature: 28)
let cloudyWeather = Weather.Cloudy(temperature: 18)
let rainyWeather = Weather.Rainy(temperature: 15)
let snowyWeather = Weather.Snowy(temperature: -5)

print(sunnyWeather.clothingRecommendation())
print(cloudyWeather.clothingRecommendation())
print(rainyWeather.clothingRecommendation())
print(snowyWeather.clothingRecommendation())

print ("\n", "#3", "\n")
/*
 შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.
 */

struct Book {
    let title: String
    let author: String
    let publicationYear: Int

    init(title: String, author: String, publicationYear: Int) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
    }
}

var library: [Book] = []

library.append(Book(title: "The Catcher in the Rye", author: "J.D. Salinger", publicationYear: 1951))
library.append(Book(title: "To Kill a Mockingbird", author: "Harper Lee", publicationYear: 1960))
library.append(Book(title: "1984", author: "George Orwell", publicationYear: 1949))
library.append(Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", publicationYear: 1925))
library.append(Book(title: "Pride and Prejudice", author: "Jane Austen", publicationYear: 1813))

func booksPublishedInOrAfterYear(library: [Book], year: Int) -> [Book] {
    let filteredBooks = library.filter { $0.publicationYear >= year }
    return filteredBooks
}

let filteredBooks = booksPublishedInOrAfterYear(library: library, year: 1950)

for book in filteredBooks {
    print("\(book.title) by \(book.author) (\(book.publicationYear))")
}

print ("\n", "#4", "\n")
/*
 შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
 */

struct BankAccount {
    let accountHolderName: String
    let accountNumber: String
    var balance: Double

    init(accountHolderName: String, accountNumber: String, initialBalance: Double) {
        self.accountHolderName = accountHolderName
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }

    mutating func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("Deposited \(amount) into account \(accountNumber). New balance: \(balance)")
        }
    }

    mutating func withdraw(amount: Double) {
        if amount > 0 && balance >= amount {
            balance -= amount
            print("Withdrawn \(amount) from account \(accountNumber). New balance: \(balance)")
        } else {
            print("Insufficient funds to withdraw \(amount) from account \(accountNumber).")
        }
    }
}

var myAccount = BankAccount(accountHolderName: "John Doe", accountNumber: "1234567890", initialBalance: 1000.0)

myAccount.deposit(amount: 500.0)
myAccount.withdraw(amount: 200.0)
myAccount.withdraw(amount: 1500.0)


print ("\n", "#5", "\n")
/*
 შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
 */


enum Genre {
    case House, Techno, HipHop, Classical
}

struct Song {
    let title: String
    let artist: String
    let duration: Int
    let genre: Genre
    
    var description: String {
        return  "Song named" + "\(title)" + "is produced by" + "\(artist)"
    }
    
    lazy var publisher: String = {
        return "\(artist)'s Records"
    }()
    
    
    func displayInfo() {
        print("Title: \(title)")
        print("Artist: \(artist)")
        print("Duration: \(duration) seconds")
        print("Genre: \(genre)")
        print("--------------------")
    }
}

func displaySongsByGenre(_ playlist: [Song], genre: Genre) {
    for song in playlist {
        if song.genre == genre {
            song.displayInfo()
        }
    }
}

let playlist: [Song] = [
    Song(title: "Invisible", artist: "Michael Gray", duration: 235, genre: .House),
    Song(title: "Midnight Magic", artist: "Steve Rachmad", duration: 424, genre: .House),
    Song(title: "Wait till the end", artist: "Laidlaw", duration: 289, genre: .House),
    Song(title: "The Extremist", artist: "Jeff Mills", duration: 520, genre: .Techno),
    Song(title: "Sicko Mode", artist: "Travis Scott", duration: 312, genre: .HipHop),
    Song(title: "Dopeman", artist: "Eazy-E", duration: 412, genre: .HipHop),
    Song(title: "Moonlight Sonata", artist: "Beethoven", duration: 392, genre: .Classical),
]

displaySongsByGenre(playlist, genre: .HipHop)
