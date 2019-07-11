//
//  prayerViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/9/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class prayerViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.darkGray.cgColor
        
        submitButton.roundAllButtonCorners()
    

        // Do any additional setup after loading the view.
    }
    
}
