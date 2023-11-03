//
//  ViewController.swift
//  Calculator
//
//  Created by pro on 2022/10/9.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displaylabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var digitOnDisplay:String{
        get
        {
            return self.displaylabel.text!
        }
        
        set
        {
            self.displaylabel.text!=newValue
        }
        
    }
    
    var inTypingMode=false
    
   
    @IBAction func numberTouched(_ sender: UIButton) {
        if inTypingMode
        {
            digitOnDisplay=digitOnDisplay+sender.currentTitle!
        }
        else{
            digitOnDisplay=sender.currentTitle!
            inTypingMode=true;
        }
        
        
    }
    
    let calculator=myCalculator()
    @IBAction func operatorTouched(_ sender: UIButton) {
        //print("Operator touhched \(sender.currentTitle!) touched")
        if let op = sender.currentTitle{
            if let result = calculator.performOperation(operation: op, operand: Double(digitOnDisplay)!){
                digitOnDisplay=String(result)
            }
            inTypingMode=false
        }
    }
    
    
}

