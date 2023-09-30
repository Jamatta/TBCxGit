print ("\n", "#1", "\n")
/*
 შექმენით array, შემდეგ პირველ და ბოლო ელემენტს გაუცვალეთ ადგილი, გამზადებული ან უკვე არსებული ფუნქციის გარეშე.  (array-ის ტიპს არაქვს მნიშვნელობა).
 */

var array = [1, 2, 3, 4, 5, 6, 7]

let firstNumber = array[0]
array[0] = array[array.count - 1]
array[array.count - 1] = firstNumber
print ("Switched array is -", array)


print ("\n", "#2", "\n")
/*
 შექმენით array, მასში წაშალეთ ნახევარი ელემენტები, თუ კენტი რაოდენობის იქნა დატოვეთ ნაკლები და წაშალეთ მეტი.  მაგ.: თუ იყო 11 ელემენტი 5 დატოვეთ და 6 წაშალეთ. და დაბეჭდეთ მიღებული შედეგი. (array-ის ტიპს არაქვს მნიშვნელობა).
 */

var numbersArray = Array (repeating: 0, count: 17)
var halfOfArray = (numbersArray.count / 2)

if halfOfArray * 2 == numbersArray.count {
    for i in 0..<halfOfArray {
        numbersArray.remove(at: i)
    }
} else {
    for i in 0...halfOfArray {
        numbersArray.remove(at: i)
    }
}
print ("Half of array is -", numbersArray)

print ("\n", "#3", "\n")
/*
 შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.
 */

var numbersArray10 = [Int]()
var oddsArray = [Int]()
var evensArray = [Int]()

for i in 1...10 {
    numbersArray10.append(i)
}
print("Array - ", numbersArray10)

for number in numbersArray10 {
    if number % 2 == 0 {
        evensArray.append(number)
    } else {
        oddsArray.append(number)
    }
}
print("Odds - ", oddsArray)
print("Evens - ", evensArray)

print ("\n", "#4", "\n")
/*
 შექმენით Double-ების array, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ array-ში.
 */

let doubleArray = [10.4, 0.3, 4, 5.9, 2.13, 13, 48.5, 4]
var largestNumber: Double = 0

for number in doubleArray {
    if number > largestNumber {
        largestNumber = number
    }
}
print("Largest number in array is - ", largestNumber)
print ("\n", "#5", "\n")
/*
 შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.
 */

var notSortedArray = [8, 4, 9, 9, 0, 2]
var notSortedArray2 = [1, 0, 9, 2, 3, 7, 0, 1]
var mergedArray = notSortedArray + notSortedArray2
print("Unsorted array - ", mergedArray)

for _ in 0..<mergedArray.count {
    for j in 0..<(mergedArray.count - 1) {
        if mergedArray[j] > mergedArray[j + 1] {
            let swapNumber = mergedArray[j]
            mergedArray[j] = mergedArray[j + 1]
            mergedArray[j + 1] = swapNumber
        }
    }
}
print("Sorted array - ", mergedArray)
print ("\n", "#6", "\n")
/*
 შექმენით String ტიპის ცვლადი და შეამოწმეთ არის თუ არა ყველა ჩარაქტერი ამ სტრინგში უნიკალური. გამოიყენეთ Set-ი ამ თასკის შესასრულებლად.
 */

let anyWOrds = "Lorem ipsum"
var emptySet = Set<String>()

for char in anyWOrds {
    emptySet.insert(String(char))
}
if anyWOrds.count == emptySet.count {
    print ("There is not repeatable character")
} else {
    print ("anyWOrds contains repeatable character")
}

print ("\n", "#7", "\n")
/*
 შექმენით ორი Int-ების Set. გამოიყენეთ მათზე Set-ის მეთოდები როგორიცაა: union, intersection და difference. დაბეჭდეთ შედეგები.
 */

let evenNumbers: Set = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
let randomNumbers: Set = [5, 2, 17, 18, 7, 2, 12, 21, 6]

let evenRandomNumbers = evenNumbers.intersection(randomNumbers)
let combinedSet = evenNumbers.union(randomNumbers)
let diff = evenNumbers.symmetricDifference(randomNumbers)

print("intersection -", evenRandomNumbers)
print("union -", combinedSet)
print("Difference -", diff)
print ("\n", "#8", "\n")
/*
 შექმენით ორი String-ის Set. შეამოწმეთ არის თუ არა პირველი String-ის Set, მეორეს sub-Set-ი. დაბეჭდეთ შედეგი.
 */

var firstSet: Set<String> = ["Lorem", "ipsum", "dolor", "amet",]
var secondSet: Set<String> = ["Lorem", "amet", "consectetur", "adipiscing"]

if firstSet.count <= secondSet.count {
    let count = secondSet.count - firstSet.count
    let subtr = secondSet.subtracting(firstSet)
    if subtr.count == 0 {
        print ("firstSet is subset for secondSet")
    } else {
        print ("firstSet is not subset for secondSet")
    }
} else {
    print ("firstSet is not subset for secondSet")
}
print ("\n", "#9", "\n")
/*
 შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)
 */

let myArray = [3, 89, 10, 4, 23, 4, 323]
var mySet = Set<Int>()

for numbers in myArray {
    mySet.insert(numbers)
}
if myArray.count == mySet.count {
    print ("array-ში ყველა ელემენტი განსხვავებულია")
} else {
    print ("array შეიცავს მსგავს ელემენტებს")
}
print ("\n", "#10", "\n")
/*
 შექმენით Dictionary, სადაც იქნება ფილმის სახელები და მათი რეიტინგები, რეიტინგი (0-10). დაამატეთ მინიმუმ 5 ფილმი, ამის შემდეგ გამოთვალეთ ამ Dictionary-ში არსებული ფილმების საშვალო რეიტინგი. დაბეჭდეთ მიღებული შედეგი.
 */
let imdbDictionary = [
    "Interstellar": 8,
    "Saving Private Ryan": 8,
    "City of God": 7,
    "The Green Mile": 7,
    "Fight Club": 8
]
var totalRatings = 0
let ratings = imdbDictionary.values
for number in ratings {
    totalRatings += number
}
let averageRating: Double = Double(totalRatings / imdbDictionary.count)
print (averageRating)
