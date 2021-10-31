//
//  AccessLoginViewController.swift
//  LoginApp
//
//  Created by Илья Маркелов on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingsUserNameLabel: UILabel!
    
    var user: User!
    
    // MARK: - Private properties
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        greetingsUserNameLabel.text = user.fullname.fullName
        
    }
    @IBAction func logOutPressed() {
        dismiss(animated: true)
    }
}

// MARK: - Set background color
extension WelcomeViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
