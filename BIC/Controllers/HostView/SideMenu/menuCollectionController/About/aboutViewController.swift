//
//  aboutViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 8/13/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {
    
    lazy var firstFooterButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: 200, height: 100))
        button.footerImageButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "ourVision"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var secondFooterButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 20, y: 150, width: 200, height: 100))
        button.footerImageButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "ourMission"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .top
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var thirdFooterButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 20, y: 275, width: 200, height: 100))
        button.footerImageButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "ourCoreValues"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
        
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        stack.addArrangedSubview(firstFooterButton)
        stack.addArrangedSubview(secondFooterButton)
        stack.addArrangedSubview(thirdFooterButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonStack)
  
        
        NSLayoutConstraint.activate([
            
            buttonStack.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            buttonStack.heightAnchor.constraint(equalToConstant: view.frame.height - 20),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

    }
    



}
