//
//  ViewController.swift
//  Activity Lifecycle
//
//  Created by Aleksey Koptelin on 2019-03-12.
//  Copyright © 2019 Aleksey K. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("* - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("** - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("*** - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("** - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("* - viewDidDisappear")
    }
    
    deinit {
        print("deinit")
    }
}
