//
//  ViewController.swift
//  Equation Solver
//
//  Created by Aleksey Koptelin on 2019-02-18.
//  Copyright © 2019 Aleksey K. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // TODO: read about localization
    
    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var resultDiscriminant: UILabel!
    @IBOutlet weak var resultX2: UILabel!
    @IBOutlet weak var resultX1: UILabel!
    @IBOutlet weak var solveButton: UIButton!
    
    @IBAction func solveEquation(_ sender: Any) {

        guard let aTextFieldContent = aTextField.text, !aTextFieldContent.isEmpty else {
            animateTextInput(weak: aTextField)
            return
        }
        returnRegularViewForInput(weak: aTextField)
        
        guard let bTextFieldContent = bTextField.text, !bTextFieldContent.isEmpty else {
            animateTextInput(weak: bTextField)
            return
        }
        returnRegularViewForInput(weak: bTextField)

        guard let cTextFieldContent = cTextField.text, !cTextFieldContent.isEmpty else {
            animateTextInput(weak: cTextField)
            return
        }
        returnRegularViewForInput(weak: cTextField)
        
        let a = Double(aTextFieldContent)
        let b = Double(bTextFieldContent)
        let c = Double(cTextFieldContent)
k
        if (a != nil && b != nil && c != nil) {
            let d: Double = pow(b!, 2) - 4 * a! * c!
            var x1: Double? = nil
            var x2: Double? = nil
            
            if (d > 0) {
                x1 = (-b! + sqrt(d)) / 2 * a!
                x2 = (-b! - sqrt(d)) / 2 * a!
            }
            else if (d == 0) {
                x1 = (-b!) / 2 * a!
                x2 = x1
            }
            else {
                x1 = nil
                x2 = nil
            }
            
            resultDiscriminant.text = String(d)
            if (x1 != nil && x2 != nil) {
                resultX1.text = String(format: "%.2f", x1!)
                resultX2.text = String(format: "%.2f", x2!)
            }
            else {
                resultX1.text = String("-")
                resultX2.text = String("-")
            }
        }
        
        let someText = NSLocalizedString("A_B_C", comment: "")
        print(someText)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func returnRegularViewForInput(weak textInput: UITextField?) {
        textInput!.layer.borderWidth = 0.0
    }
    
    func animateTextInput(weak textInput: UITextField?) {
        textInput!.frame = CGRect(x: textInput!.frame.minX,
                                  y: textInput!.frame.minY - 2,
                                  width: textInput!.frame.width,
                                  height: textInput!.frame.height)
        
        UIView.animate(withDuration: 0.5) {
            textInput!.frame = CGRect(x: textInput!.frame.minX,
                                           y: textInput!.frame.minY + 2,
                                           width: textInput!.frame.width,
                                           height: textInput!.frame.height)
            
            textInput!.layer.borderColor = UIColor.red.cgColor
            textInput!.layer.borderWidth = 1.0
        }
    }
}
