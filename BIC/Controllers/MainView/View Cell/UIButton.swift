//
//  UIButton.swift
//  BIC
//
//  Created by Iwan Siauw on 3/27/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func footerImageButton(){
        
//        layer.borderWidth = 3
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 20
        
        // adding shadow doesnt work
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
//        layer.shadowOpacity = 1.0
//        layer.shadowRadius = 4.0
        
        layer.masksToBounds = false
        clipsToBounds = true
    }

}

