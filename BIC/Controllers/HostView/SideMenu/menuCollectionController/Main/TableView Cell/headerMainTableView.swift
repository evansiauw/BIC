//
//  headerMainTableView.swift
//  BIC
//
//  Created by Iwan Siauw on 3/27/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

/*
 -  Need to change the addButton TYPE to system in the button declaration, because it is not showing highlight when pressed
 */

import UIKit

class headerMainTableView: UITableViewHeaderFooterView {

    lazy var addButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "addBlack"), for: .normal)
        button.addTarget(self, action: #selector(addPosting), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
    }()
    
    lazy var title: UILabel = {
        
        let label = UILabel()
        label.textColor = .darkText
        label.font = UIFont(name: "Rockwell", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        
        contentView.addSubview(addButton)
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            title.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: 5)
        ])
        
    }
    
    @objc func addPosting(){
        print("Add button in the headerTableView pressed")
    }
    
}



//    lazy var stackView: UIStackView = {
//
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.distribution = .fill
//        stack.alignment = .trailing
//        stack.spacing = 5
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.addArrangedSubview(title)
//        stack.addArrangedSubview(addButton)
//        return stack
//    }()
