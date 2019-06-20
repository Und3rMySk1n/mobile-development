//
//  CategoryViewController.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 20/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var category: Category?
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        if saveCategory() {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = category {
            nameTextField.text = category.name
        }
    }
    
    func saveCategory() -> Bool {

        if nameTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the name of the Category!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }

        if category == nil {
            category = Category()
        }
        
        if let category = category {
            category.name = nameTextField.text
            CoreDataManager.instance.saveContext()
        }
        
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
