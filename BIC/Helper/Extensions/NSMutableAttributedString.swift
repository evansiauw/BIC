//
//  NSMutableAttributedString.swift
//  BIC
//
//  Created by Iwan Siauw on 10/16/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}
