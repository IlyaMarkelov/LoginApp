//
//  ViewController.swift
//  LoginApp
//
//  Created by Илья Маркелов on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = User.getUserData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        userNameTextField.returnKeyType = .next
            
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
            
        passwordTextField.isEnabled = true
        passwordTextField.enablesReturnKeyAutomatically = true
        }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let viewControllers = tabBarController.viewControllers
        if let vcs = viewControllers {
            for viewController in vcs {
                if let welcomeVC = viewController as? WelcomeViewController { welcomeVC.user = user }
                if let generalVC = viewController as? GeneralViewController { generalVC.user = user }
                if let hobbyVC = viewController as? HobbyViewController { hobbyVC.user = user }
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - IB Actions
    @IBAction func logInAction() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            alert(title: "Invalid login or password",
                  message: "Please, enter correct login and password",
                  textField: passwordTextField)
        }
    }
    
    @IBAction func forgotUserNameAction() {
        alert(title: "Oops!",
              message: "Your user name is \(user.login)")
    }
    
    @IBAction func forgotPasswordAction() {
        alert(title: "Oops!",
              message: "Your password is \(user.password)")
    }
    
    // MARK: - Alert action
    private func alert(title: String, message: String, textField: UITextField? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { _ in
            textField?.text = nil
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInAction()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}


