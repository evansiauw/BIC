//
//  eventCollectionViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 4/17/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

class eventCollectionViewCell: UICollectionViewCell {
    
    let labelContainerHeight: CGFloat = 80
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - labelContainerHeight)
        let image = UIImageView(frame: frame)
        image.backgroundColor = .blue
        image.image = UIImage(named: "godIsGood")
        image.roundSomeCorners(corners: [.topLeft, .topRight], radius: 8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var labelContainerView: UIView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: labelContainerHeight)
        let view = UIView(frame: frame)
        view.backgroundColor = .darkGray
        view.roundSomeCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
//    lazy var titleLabel: UILabel = {
//
//        let frame = CGRect(x: 0, y: self.frame.height - 80, width: self.frame.width, height: 80)
//        let label = UILabel(frame: frame)
//        label.text = "Merry Christmas"
//        label.textColor = .white
//        label.backgroundColor = .darkGray
//        label.textAlignment = .center
//        label.roundSomeCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cellImage)
        self.addSubview(labelContainerView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}































//lazy var announcementButton: UIButton = {
//
//    let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//    let button = UIButton(frame: frame)
//    button.backgroundColor = UIColor.blue
//    button.setImage(UIImage(named: "godIsGood"), for: .normal)
//    button.setTitle("Happy Easter", for: .normal)
//    button.setTitleColor(UIColor.red, for: .normal)
//    button.roundAllCorners()
//    button.centerVertically()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    return button
//}()

