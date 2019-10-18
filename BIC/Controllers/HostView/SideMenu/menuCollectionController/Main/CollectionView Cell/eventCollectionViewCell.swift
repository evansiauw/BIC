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
    
    
    // PROPERTIES
    let labelStackContainerHeight: CGFloat = 90
    let padding: CGFloat = 5
    
    lazy var cellImage: UIImageView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - labelStackContainerHeight)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "noImage")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .lightGray
        image.roundSomeImageCorners(corners: [.topLeft, .topRight], radius: 8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {

        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 40)
        let label = UILabel(frame: frame)
        label.font = UIFont(name: "Rockwell", size: 18)
        label.numberOfLines = 0
//        label.sizeToFit()
        label.textColor = UIColor(red: 27, green: 20, blue: 100)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
        let label = UILabel(frame: frame)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "December 31st, 2019 at 12:00am"
        label.numberOfLines = 2
        label.backgroundColor = .white
        label.textColor = UIColor(red: 27, green: 20, blue: 100)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var attendeesLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
        let label = UILabel(frame: frame)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Error"
        label.textColor = UIColor(red: 27, green: 20, blue: 100)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.roundSomeLabelCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
        label.padding = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelStack: UIStackView = {
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: labelStackContainerHeight)
        let stack = UIStackView(frame: frame)
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 0
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(attendeesLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var cellStack: UIStackView = {
        
        let frame = CGRect(x: 0, y: padding, width: self.frame.width, height: self.frame.height - padding)
        let stack = UIStackView(frame: frame)
        stack.axis = .vertical
        stack.distribution = .fill
        stack.addArrangedSubview(cellImage)
        stack.addArrangedSubview(labelStack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cellStack)
        
        titleLabel.padding = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            attendeesLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            cellImage.heightAnchor.constraint(equalToConstant: 170),
            
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

