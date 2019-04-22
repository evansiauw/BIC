//
//  eventCollectionViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 4/13/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

/* TODO:
 - setup a stack for cellImage and titleLabel
 - setup constraint for either cellImage or titleLabel
 */
class announcementCollectionViewCell: UICollectionViewCell {
    
        lazy var cellImage: UIImageView = {
    
            let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 40)
            let image = UIImageView(frame: frame)
            image.image = UIImage(named: "profileWallpaper")
            image.roundSomeImageCorners(corners: [.topLeft, .topRight], radius: 8)
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
    
        lazy var titleLabel: UILabel = {
    
            let frame = CGRect(x: 0, y: self.frame.height - 40, width: self.frame.width, height: 40)
            let label = UILabel(frame: frame)
//            label.text = "Hello"
            label.textColor = .white
            label.backgroundColor = .darkGray
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
//            label.font = UIFont(name: "party LET", size: 30)
            label.roundSomeLabelCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cellImage)
        self.addSubview(titleLabel)
        
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
