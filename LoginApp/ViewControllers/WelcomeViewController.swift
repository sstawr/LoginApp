//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 28.11.23.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeMessageLabel: UILabel!
    
    var userNameValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemMint.cgColor,
            UIColor.systemOrange.cgColor
        ]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        welcomeMessageLabel.text = "Welcome, \(userNameValue ?? "")!"
    }
}
