//
//  HobbyViewController.swift
//  LoginApp
//
//  Created by Илья Маркелов on 31.10.2021.
//

import UIKit

class HobbyViewController: UIViewController {

    @IBOutlet var firstHobbyLabel: UILabel!
    @IBOutlet var secondHobbyLabel: UILabel!
    @IBOutlet var thirdHobbyLabel: UILabel!
    @IBOutlet var fourthHobbyLabel: UILabel!
    @IBOutlet var fifthHobbyLabel: UILabel!
    
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
        for hobby in user.hobbies {
            switch hobby {
            case .computerGames:
                firstHobbyLabel.text = "- " + hobby.rawValue
            case .guiter:
                secondHobbyLabel.text = "- " + hobby.rawValue
            case .camping:
                thirdHobbyLabel.text = "- " + hobby.rawValue
            case .coding:
                fourthHobbyLabel.text = "- " + hobby.rawValue
            case .cooking:
                fifthHobbyLabel.text = "- " + hobby.rawValue
            }
            
        }
    }
}

// MARK: - Set background color
extension HobbyViewController {
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
