//
//  ViewController.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 28.11.23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private let username = "user"
    private let password = "111"
    
    // MARK: - Overrides Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTextField.text == username,
              passwordTextField.text == password else {
            showAlert(
                withTItle: "Ivalid username or password",
                andMessage: "Please enter correct data"
            )
            return false
        }

        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userNameValue = userNameTextField.text
    }
    
    // MARK: - IB Actions
    @IBAction func forgotUsernameButtonDidTapped() {
        showAlert(withTItle: "Oops", andMessage: "Your username is \(username)")
    }
    
    @IBAction func forgotPasswordButtonDidTapped() {
        showAlert(withTItle: "Oops", andMessage: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private Methods
    private func showAlert(withTItle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
