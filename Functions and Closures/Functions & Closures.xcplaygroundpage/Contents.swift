print ("\n", "#1", "\n")
/*
 შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.
 */

func factorial(number: Int) -> Int {
    var result = 1
    for i in  2...n {
        result *= i
    }
    return result
    
}

let n = 5
let result = factorial(number: n)

print ("\n", "#2", "\n")
/*
 შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.
 */

func fibonacci(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        var a = 0
        var b = 1
        var result = 0
        
        for _ in 2...n {
            result = a + b
            a = b
            b = result
            print(result)
        }
        return result
    }
}

let fibNum = 20
let fibResult = fibonacci(fibNum)

print ("\n", "#3", "\n")
/*
 შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.
 */

func isStringPalindrome(_ anyWord: String) -> Bool {
    let characters = Array(anyWord)
    let lenght = characters.count
    
    for i in 0..<lenght/2 {
        if characters[i] != characters[lenght - 1 - i] {
            return false
        }
    }
    return true
}

let anyWord = "saippuakivikauppias"
if isStringPalindrome(anyWord) {
    print("\(anyWord) is a palindrome")
} else {
    print("\(anyWord) is not a palindrome")
}

print ("\n", "#4", "\n")
/*
 შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
 */

func squareNumbers(_ anyArray: [Int]) -> [Int] {
    var squaredArray = anyArray
    
    for i in 0..<squaredArray.count  {
        squaredArray[i] = squaredArray[i] * squaredArray[i]
    }
    print(squaredArray)
    return squaredArray
}

var arrayNumber = [3, 4, 10, 6, 35]
squareNumbers(arrayNumber)

print ("\n", "#5", "\n")
/*
 შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]
 */

func createCountedDictionary(_ newString: String) -> [String: Int] {
    var splitWords = newString.split(separator: " ")
    var wordCount: [String: Int] = [:]
    
    for word in splitWords {
        var wordString = String(word).lowercased()
        
        if wordString.last == "." || wordString.last == "," {
            wordString.removeLast()
        }
        wordCount[wordString, default: 0] += 1
    }
    return wordCount
}

var newString = "TBC x USAID, tbc it academy, we are in TBC academy."
let myDictionary = createCountedDictionary(newString)
print(myDictionary)
print ("\n", "#6", "\n")
/*
 შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.
 */

let binaryConverter: (_ regularNumber: Int) -> String = { (binaryNumber) in
    var binaryNumber = ""
    var number = regularNumber
    
    if regularNumber == 0 {
        return "0"
    }
    while number > 0 {
        let counter = number % 2
        binaryNumber = String(counter) + binaryNumber
        number /= 2
    }
    return  binaryNumber
}

let regularNumber = 113
let binResult = binaryConverter(regularNumber)
print(binResult)

print ("\n", "#7", "\n")
/*
 შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.
 
 ---
 სანამ closures - ს  ჩავწვდებოდი

 let arrayFilter: ([Int]) -> [Int] = { numbersArray in
     var filteredArray = numbersArray.filter {$0 % 2 == 0 }
     
     return filteredArray
 }
 let numbersArray = [5, 23, 43, 12, 8, 24, 89]
 let filterArray = arrayFilter(numbersArray)
 print(filterArray)
 
 */
let numbersArray = [5, 23, 43, 12, 8, 24, 89]

var arrayFilter: [Int] = numbersArray.filter({ $0 % 2 == 0 })
print(arrayFilter)


print ("\n", "#8", "\n")
/*
 შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.
 */
let numbersArray1 = [5, 23, 43, 12, 8, 24, 89]

var newNumbersArray: [Int] = numbersArray1.map ({ $0 * 10 })
print(newNumbersArray)

print ("\n", "#9", "\n")
/*
 გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
 */

import Dispatch

func printArrayWithDelay(_ numArray: [Int], closure: @escaping (Double) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        let sum = numArray.reduce(0, +)
        print(sum)
    }
    print("Sum of array will be printed after 3 seconds")
}

let numArray = [1, 2, 4, 6, 13, 17]
printArrayWithDelay(numArray) { delay in }

print ("\n", "#10", "\n")
/*
 function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
 */

func filterArrayByodd(_ oneMoreArray: [Int]) -> [Int] {
    let oddsArray = oneMoreArray.filter({ $0 % 2 != 0 })
    print(oddsArray)
    return oddsArray
}

let arrayTommorrow = [31, 34, 12, 53, 64, 23, 54, 19, 55]
filterArrayByodd(arrayTommorrow)

