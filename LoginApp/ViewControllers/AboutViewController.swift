//
//  AboutViewController.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 2.12.23.
//

import UIKit

final class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemIndigo.cgColor,
            UIColor.systemOrange.cgColor
        ]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
