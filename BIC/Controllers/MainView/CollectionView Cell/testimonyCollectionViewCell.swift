//
//  testimonyCollectionViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 4/18/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit


/* TODO:
 - create stack for cellImage and titleLabel, add constraint to the stack
 -
 -
*/
 
class testimonyCollectionViewCell: UICollectionViewCell {
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 20)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "powerOfTestimony")
        image.circleProfile()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: cellImage.frame.height, width: self.frame.width, height: self.frame.height - cellImage.frame.height)
        let label = UILabel(frame: frame)
//        label.text = "God is Good"
        label.textColor = .brown
        label.backgroundColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cellImage)
        self.addSubview(titleLabel)
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
