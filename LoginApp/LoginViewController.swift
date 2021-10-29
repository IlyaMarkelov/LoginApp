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
    private var correctUserName = "User"
    private var correctPassword = "Password"

    
    
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
        guard let accessLoginVC = segue.destination as? WelcomeViewController else { return }
        accessLoginVC.userName = userNameTextField.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - IB Actions
    @IBAction func logInAction() {
        if userNameTextField.text != correctUserName || passwordTextField.text != correctPassword {
            alert(title: "Invalid login or password",
                  message: "Please, enter correct login and password",
                  textField: passwordTextField)
        }
    }
    
    @IBAction func forgotUserNameAction() {
        alert(title: "Oops!",
              message: "Your user name is \(correctUserName)")
    }
    
    @IBAction func forgotPasswordAction() {
        alert(title: "Oops!",
              message: "Your password is \(correctPassword)")
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


