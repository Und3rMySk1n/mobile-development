//
//  MedicamentViewController.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 21/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//

import UIKit

class MedicamentViewController: UIViewController {
    
    var medicament: Medicament?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        if saveMedicament() {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let medicament = medicament {
            nameTextField.text = medicament.name
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func saveMedicament() -> Bool {
        
        if nameTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the name of the medicament!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        if medicament == nil {
            medicament = Medicament()
        }
        
        if let medicament = medicament {
            medicament.name = nameTextField.text
            CoreDataManager.instance.saveContext()
        }
        
        return true
    }

}
