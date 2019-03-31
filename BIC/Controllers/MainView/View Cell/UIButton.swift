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
        layer.borderWidth = 3
        layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 20
        clipsToBounds = true
    }

}

