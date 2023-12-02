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
    private let user = User.getUser()
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = user.userName
        passwordTextField.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTextField.text == user.userName,
              passwordTextField.text == user.password else {
            showAlert(
                withTItle: "Ivalid username or password",
                andMessage: "Please enter correct data") {
                    self.passwordTextField.text = ""
                }
            return false
        }

        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach{ viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userNameValue = userNameTextField.text
                welcomeVC.person = user.person
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutVC = navigationVC.topViewController as? AboutViewController
                aboutVC?.title = user.person.firstName + " " + user.person.lastName
                aboutVC?.personInfo = user.person
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTItle: "Oops", andMessage: "Your username is \(user.userName)")
        : showAlert(withTItle: "Oops", andMessage: "Your password is \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private Methods
    private func showAlert(withTItle title: String, andMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
