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
    
    let stackContainerHeight: CGFloat = 110
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - stackContainerHeight)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "merryChristmas")
        image.contentMode = .scaleAspectFill
        image.roundSomeImageCorners(corners: [.topLeft, .topRight], radius: 8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {

        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 60)
        let label = UILabel(frame: frame)
//        label.text = "Christmas Eve"
        label.font = UIFont(name: "Rockwell", size: 20)
        label.numberOfLines = 0
//        label.sizeToFit()
        label.textColor = .brown
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
        let label = UILabel(frame: frame)
        label.text = "Jan 1st, 2020 at 5pm"
        label.textColor = .brown
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var attendeesLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
        let label = UILabel(frame: frame)
        label.text = "0 people going"
        label.textColor = .brown
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelStack: UIStackView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: stackContainerHeight)
        let stack = UIStackView(frame: frame)
        stack.axis = .vertical
        stack.alignment = .center
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(attendeesLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var cellStack: UIStackView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let stack = UIStackView(frame: frame)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.addArrangedSubview(cellImage)
        stack.addArrangedSubview(labelStack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cellStack)
        
        NSLayoutConstraint.activate([labelStack.heightAnchor.constraint(equalToConstant: stackContainerHeight)])
        
        NSLayoutConstraint.activate([
            cellImage.heightAnchor.constraint(equalToConstant: self.frame.height - stackContainerHeight)
            ])
        
//        NSLayoutConstraint.activate([
//            cellStack.leadingAnchor.constraint(equalTo: self.frame.)
//
//            ])
        


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


























//
//        NSLayoutConstraint.activate([
//            cellImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            cellImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//            cellImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
//            cellImage.heightAnchor.constraint(equalToConstant: self.frame.height - stackContainerHeight)
//            ])
//
//        NSLayoutConstraint.activate([
//            labelStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            labelStack.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 5),
//            labelStack.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
//            labelStack.heightAnchor.constraint(equalToConstant: stackContainerHeight)
//            ])


//    lazy var labelContainerView: UIView = {
//
//        let frame = CGRect(x: 0, y: self.frame.height - labelContainerHeight, width: self.frame.width, height: labelContainerHeight)
//        let view = UIView(frame: frame)
//        view.backgroundColor = .clear
//        view.roundSomeViewCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()

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

