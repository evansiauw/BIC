//
//  mainCollectionViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 3/31/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

/* TODO:
 - create stack for cellImage and titleLabel, add constraint to the stack
 -
 -
 */

class mainCollectionViewCell: UICollectionViewCell {
    
    let padding: CGFloat = 5
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: padding, width: self.frame.width, height: self.frame.height - 35)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "devotional")
        image.contentMode = .scaleAspectFill
        image.roundSomeImageCorners(corners: [.topLeft, .topRight], radius: 8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: cellImage.frame.height, width: self.frame.width, height: self.frame.height - cellImage.frame.height - padding)
        let label = UILabel(frame: frame)
        label.roundSomeLabelCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell", size: 14)
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
















//    lazy var stackView: UIStackView = {
//
//        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//        let stack = UIStackView(frame: frame)
//        stack.spacing = 0
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()

//        stackView.addArrangedSubview(cellImage)
//        stackView.addArrangedSubview(titleLabel)


//        NSLayoutConstraint.activate([
//            cellImage.topAnchor.constraint(equalTo: stackView.topAnchor),
//            cellImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//            cellImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            cellImage.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>)
//            ])

//        self.contentView.addSubview(cellImage)



