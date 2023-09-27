//Separator
print ("\n", "#1 ------", "\n")
/* 1. შექმენით ორი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ჯამი.
 */

let firstNumber: Int
let secondNumber: Int

firstNumber = 5
secondNumber = 10

print (firstNumber + secondNumber)



//Separator
print ("\n", "#2 ------", "\n")


/* 2. შექმენით Int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა, და შეამოწმეთ არის თუ არა ეს რიცხვი 10-ზე მეტი და 20-ზე ნაკლები ან ტოლი, 20-ზე მეტი და 50-ზე ნაკლები ან ტოლი, 50-ზე მეტი და 100-ზე ნაკლები ან ტოლი, 100-ზე მეტი და შედეგი დაბეჭდეთ.
 */

let number: Int = 37

    if number > 10 && number <= 20 {
    print (number, "is > 10 and <= 20")
}
    else if number > 20 && number <= 50 {
        print (number, "is > 20 and <= 50")
}
    else if number > 50 && number <= 100 {
        print (number, "is > 50 and <= 100")
}
    else if number > 100 {
        print (number, "is > 100")
}
    else {
        print (number, "is < 10")
}



//Separator
print ("\n", "#3 ------", "\n")


/* 3. for-in ციკლის გამოყენებით, დაბეჭდეთ რიცხვები 1-იდან 20-ამდე. რიცხვები ეწეროს ერთ ხაზზე, გამოყოფილი იყოს სფეისებით. შედეგი: 1 2 3 4...
 */

let interval = 1
for number in stride(from: 1, to: 20, by: interval){
    print (number, terminator: " ")
}



//Separator
print ("\n","\n", "#4 ------", "\n")

/* 4. while ციკლის გამოყენებით, 1-იდან 100-ამდე დაბეჭდეთ ყველა კენტი რიცხვის ჯამი.
 */

var sum = 0
var count = 0
let finalNumber = 100


while count <= finalNumber {
      
    if count % 2 != 0 { sum += count }
    count += 1
}
print (sum)



//Separator
print ("\n", "#5 ------", "\n")

/* 5. შექმენით String ტიპის ცვლადი, და ციკლის გამოყენებით დაარევერსეთ ეს ცვლადი, მაგ: თუ გვაქვს TBC Academy უნდა მივიღოთ ymedacA CBT.
 */

let myWord = "TBC Academy"
var reversedWord = ""
 
for char in myWord{
    reversedWord = String(char) + reversedWord
}

print (reversedWord)


//Separator
print ("\n", "#6 ------", "\n")

/* 6. დაბეჭდეთ ყველა ორნიშნა რიცხვი რომელიც ერთნაირი ციფრებით არის შედგენილი.
 */

for myNumber in 10 ... 100 {
    
    let fNum = myNumber/10
    let sNum = myNumber - fNum * 10
    
    if fNum == sNum {print (myNumber)}
}


//Separator
print ("\n", "#7 ------", "\n")

/* 7. გაქვს 9 ნიშნა რიცხვი და დაბეჭდე შებრუნებული რიცხვი.
 */

let myNumber = "123456789"
let stringNumber = String(myNumber)
var reversedW = ""
 
for char in stringNumber{
   
    reversedW = String(char) + reversedW
    
}
print (reversedW)


//Separator
print ("\n", "#8 ------", "\n")

/* 8. შექმენით bool-ეან ცვლადი, მაგალითად: isNumberFound და while loop-ის გამოყენებით იპოვეთ პირველი რიცხვი რომელიც იყოფა 5-ზეც და 9-ზეც ერთდროულად. 1-იდან დაიწყეთ ათვლა.
 */

var caunt = 0
var num5 = 0
var num9 = 0
var isNumberFound = false
while isNumberFound == false {
    caunt += 1
    if caunt % 5 == 0 {num5 = caunt}
    if caunt % 9 == 0 {num9 = caunt}
    if num5 == num9 && caunt >= 9 {isNumberFound = true}
    
}
print ("First number is - ", caunt)


//Separator
print ("\n", "#9 ------", "\n")


/* 9. შექმენი String ცვლადი მაგალითად month, რომელსაც მიანიჭებ თვის მნიშვნელობას, მაგალითად: "march" და switch statement-ის გამოყენებით დაბეჭდეთ წელიწადის რა დროა.
 */

var month = "March"

switch month {
    case "January", "February", "March":
        print ("Season - Spring")
    case "April", "May", "June":
        print ("Season - Summer")
    case "July", "August", "September":
        print ("Season - Autuom")
    default:
        print ("Season - Winter")
}



//Separator
print ("\n", "#10 ------", "\n")

/* 10. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
 */

let traffic = true
var circleColor = "red"

while traffic == true {
    
    switch circleColor {
        case "red": print ("🔴")
                    circleColor = "yellow"
        case "yellow": print ("🌕")
                    circleColor = "green"
        default: print ("🟢")
                    circleColor = "red"
    }
    
}
