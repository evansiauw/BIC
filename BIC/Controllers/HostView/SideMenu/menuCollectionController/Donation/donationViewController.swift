//
//  donationViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/9/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class donationViewController: UIViewController {
    
    @IBOutlet weak var donationButton: UIButton!
    
    @IBAction func donationWebsite(_ sender: Any) {
        
        guard let url = URL(string: "https://www.bethelic.com/building-fund-donation/") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        donationButton.roundAllButtonCorners()
    }
 

}
