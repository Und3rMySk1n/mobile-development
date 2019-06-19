//
//  ColorSwitchViewController.swift
//  Splash Screen
//
//  Created by Aleksey Koptelin on 09/04/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//

import Foundation
import UIKit



class ColorSwitchViewController: UIViewController {
    
    @IBOutlet weak var coloredText: UITextView!
    
    @IBAction func onColorChanged(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            self.view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            coloredText.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            coloredText.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        else if (sender.selectedSegmentIndex == 1) {
            self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            coloredText.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            coloredText.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
