//
//  UIView.swift
//  BIC
//
//  Created by Iwan Siauw on 4/17/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundAllCorners(){
        layer.masksToBounds = false
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func roundSomeViewCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
