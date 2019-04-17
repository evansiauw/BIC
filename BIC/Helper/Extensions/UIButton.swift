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
    
    @objc func footerImageButton(){
        layer.cornerRadius = 20
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    func roundAllCorners(){
        layer.masksToBounds = false
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    @func roundSomeCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}



















//func centerVertically(padding: CGFloat = 6.0) {
//    guard
//        let imageViewSize = self.imageView?.frame.size,
//        let titleLabelSize = self.titleLabel?.frame.size else {
//            return
//    }
//
//    let totalHeight = imageViewSize.height + titleLabelSize.height + padding
//
//    self.imageEdgeInsets = UIEdgeInsets(
//        top: -(totalHeight - imageViewSize.height),
//        left: 0.0,
//        bottom: 0.0,
//        right: -titleLabelSize.width
//    )
//
//    self.titleEdgeInsets = UIEdgeInsets(
//        top: 0.0,
//        left: -imageViewSize.width,
//        bottom: -(totalHeight - titleLabelSize.height),
//        right: 0.0
//    )
//
//    self.contentEdgeInsets = UIEdgeInsets(
//        top: 0.0,
//        left: 0.0,
//        bottom: titleLabelSize.height,
//        right: 0.0
//    )
//}

// adding shadow doesnt work
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
//        layer.shadowOpacity = 1.0
//        layer.shadowRadius = 4.0
//        layer.borderWidth = 3
//        layer.borderColor = UIColor.gray.cgColor



