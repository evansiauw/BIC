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
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 20)
        let image = UIImageView(frame: frame)
        image.image = UIImage(named: "godIsGood")
        image.circleProfile()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        
        let frame = CGRect(x: 0, y: cellImage.frame.height, width: self.frame.width, height: self.frame.height - cellImage.frame.height)
        let label = UILabel(frame: frame)
        label.text = "God is Good"
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



