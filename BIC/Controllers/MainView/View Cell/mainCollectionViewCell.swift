//
//  mainCollectionViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 3/31/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class mainCollectionViewCell: UICollectionViewCell {
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "profileImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(cellImage)
        
//        NSLayoutConstraint.activate([
//            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profileImage.widthAnchor.constraint(equalToConstant: 150),
//            profileImage.heightAnchor.constraint(equalToConstant: 150),
//            profileImage.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -75)
//            ])
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
