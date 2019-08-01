//
//  UIImageView.swift
//  BIC
//
//  Created by Iwan Siauw on 3/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func circleProfile(){
//        layer.borderWidth = 3
        layer.masksToBounds = false
//        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func roundAllImageViewCorners(){
        layer.masksToBounds = false
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func roundSomeImageCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    

    
    
}
