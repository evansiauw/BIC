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
    
    let padding: CGFloat = 5
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 45)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "noImage")
        image.contentMode = .scaleAspectFill
        image.roundSomeImageCorners(corners: [.topLeft, .topRight], radius: 8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: cellImage.frame.height, width: self.frame.width, height: 35)
        let label = UILabel(frame: frame)
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell", size: 18)
        //            label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.roundSomeLabelCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cellStack: UIStackView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let stack = UIStackView(frame: frame)
        stack.axis = .vertical
        stack.distribution = .fill
        stack.addArrangedSubview(cellImage)
        stack.addArrangedSubview(titleLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cellStack)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
//            cellImage.heightAnchor.constraint(equalToConstant: 170)
            ])
        
        NSLayoutConstraint.activate([
            
            cellStack.widthAnchor.constraint(equalToConstant: self.contentView.frame.width),
            cellStack.heightAnchor.constraint(equalToConstant: self.contentView.frame.height - 10),
            cellStack.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            cellStack.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
            
            ])
        
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
