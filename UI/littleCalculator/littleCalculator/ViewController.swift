// MARK: Device: iPhone 14 Pro

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcView: UILabel!
    @IBOutlet weak var firstInp: UITextField!
    @IBOutlet weak var secondInp: UITextField!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var infoText: UILabel!
    @IBAction func changeLabelText(_ sender: Any) {
        if switcher.isOn {
            infoText.text = "უდიდესი საერთო გამყოფი"
        } else {
            infoText.text = "უმცირესი საერთო ჯერადი"
        }
    }
    
    
    @IBAction func calcButton(_ sender: Any) {
        if let firstNumber = Int(firstInp.text ?? ""),
           let secondNumber = Int(secondInp.text ?? "") {
            let result = switcher.isOn ? calculateGCD(firstNumber, secondNumber) : calculateLCM(firstNumber, secondNumber)
            calcView.text = "\(result)"
        } else {
            calcView.text = "Invalid input"
            calcView.layer.borderWidth = 1.0
            calcView.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func calculateGCD(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        var x = firstNumber
        var y = secondNumber
        
        if x < y {
            swap(&x, &y)
        }
        
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        
        return x
    }
    
    func calculateLCM(_ firstNumber: Int, _ secondNumber: Int) -> Int {
        var x = firstNumber
        var y = secondNumber
        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }
        
        let gcd = x
        let lcm = (firstNumber * secondNumber) / gcd
        
        return lcm
    }
    
}
