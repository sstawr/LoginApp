//
//  AboutViewController.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 2.12.23.
//

import UIKit

final class AboutViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var birthplaceLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
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
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        nameLabel.text = personInfo.firstName
        lastNameLabel.text = personInfo.lastName
        ageLabel.text = String(personInfo.age)
        birthplaceLabel.text = personInfo.birthPlace
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BioViewController
        bioVC?.personInfo = personInfo
    }
}
