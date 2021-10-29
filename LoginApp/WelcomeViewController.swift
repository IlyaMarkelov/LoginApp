//
//  AccessLoginViewController.swift
//  LoginApp
//
//  Created by Илья Маркелов on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingsUserNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsUserNameLabel.text = userName
        
    }
    @IBAction func logOutPressed() {
        dismiss(animated: true)
    }
}
