//
//  BioViewController.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 2.12.23.
//

import UIKit

final class BioViewController: UIViewController {
    
    @IBOutlet var bioLabel: UILabel!
    
    var personInfo: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemIndigo.cgColor,
            UIColor.systemOrange.cgColor
        ]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        bioLabel.text = personInfo.bio
    }
}
