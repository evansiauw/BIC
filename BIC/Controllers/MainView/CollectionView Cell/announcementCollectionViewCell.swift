//
//  eventCollectionViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 4/13/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class announcementCollectionViewCell: UICollectionViewCell {

        lazy var cellImage: UIImageView = {
    
            let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 40)
            let image = UIImageView(frame: frame)
            image.backgroundColor = .blue
            image.image = UIImage(named: "godIsGood")
            image.roundSomeCorners(corners: [.topLeft, .topRight], radius: 8)
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
    
        lazy var titleLabel: UILabel = {
    
            let frame = CGRect(x: 0, y: self.frame.height - 40, width: self.frame.width, height: 40)
            let label = UILabel(frame: frame)
            label.text = "Merry Christmas"
            label.textColor = .white
            label.backgroundColor = .darkGray
            label.textAlignment = .center
            label.roundSomeCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
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
