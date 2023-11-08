import UIKit
import Foundation

typealias BigInt = _BigInt<UInt>

func factorial(n: BigInt) -> BigInt {
    return n < 2 ? 1 : n * factorial(n: n - 1)
}

var finishLine = false

func leclercsRacingCar(number: BigInt) async {
    
    let result = await Task {
        factorial(n: number)
        
        if finishLine == false {
            finishLine = true
            print("🏎️ Charles Leclerc you are the champion 🏆")
        }
    }
}

func sainzsRacingCar(number: BigInt) async {
    
    let result = await Task {
        factorial(n: number)
        
        if finishLine == false {
            finishLine = true
            print("🏎️ Carlos Sainz you are the champion 🏆")
        }
    }
}

let randomNumber1 = Int.random(in: 20...50)
let randomNumber2 = Int.random(in: 20...50)

print("Number in Charles's thread is \(randomNumber1)")
print("Number in Carlos's thread is \(randomNumber2)")

Task {
    await leclercsRacingCar(number: BigInt(randomNumber1))
    await sainzsRacingCar(number: BigInt(randomNumber2))
}
