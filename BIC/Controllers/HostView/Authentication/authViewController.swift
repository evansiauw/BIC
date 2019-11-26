//
//  authViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 10/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class authViewController: UIViewController {
    

    lazy var passTextField: SkyFloatingLabelTextField = {
        
        let textField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        textField.placeholder = "Enter Password"
        textField.title = "Password"
        textField.iconImage = UIImage(named: "password")
        textField.tintColor = overcastBlueColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(passTextField)
        
        NSLayoutConstraint.activate([
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

    }
    
    @objc func dismissView(){
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
