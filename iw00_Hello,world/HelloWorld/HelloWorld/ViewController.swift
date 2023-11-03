//
//  ViewController.swift
//  HelloWorld
//
//  Created by pro on 2022/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func Print(){
        myLabel.text = "Hello,World！"
    }
    
    
    @IBOutlet weak var myLabel2: UILabel!
    
    var x: Int = 1
    @IBAction func Number(){
        
        myLabel2.text = String(x)
        x=x+1
    }

}

