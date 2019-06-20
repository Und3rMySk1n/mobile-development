//
//  DashboardViewController.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 21/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Dashboard"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = nil
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
