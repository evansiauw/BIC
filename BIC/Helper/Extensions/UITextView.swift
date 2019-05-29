//
//  UITextView.swift
//  BIC
//
//  Created by Iwan Siauw on 4/27/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

extension UITextView{
    
    func roundAllTextViewCorners(){
        layer.masksToBounds = false
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func roundSomeTextViewCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }


}

