//
//  aboutViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 8/13/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {
    
    @IBOutlet weak var visionView: UIView!
    @IBOutlet weak var missionView: UIView!
    @IBOutlet weak var coreValueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visionView.roundAllCorners()
        missionView.roundAllCorners()
        coreValueView.roundAllCorners()
        
    }
    
}






//    lazy var firstFooterButton: UIButton = {
//
//        let button = UIButton(frame: CGRect(x: 0, y: 50, width: 200, height: 300))
//        button.footerImageButton()
//        button.backgroundColor = .white
//        button.setImage(UIImage(named: "ourVision"), for: .normal)
////        button.contentHorizontalAlignment = .fill
////        button.contentVerticalAlignment = .fill
//        button.imageView?.contentMode = .topLeft
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var secondFooterButton: UIButton = {
//
//        let button = UIButton(frame: CGRect(x: 0, y: 150, width: 200, height: 400))
//        button.footerImageButton()
//        button.backgroundColor = .white
//        button.setImage(UIImage(named: "ourMission"), for: .normal)
//        button.contentHorizontalAlignment = .fill
//        button.contentVerticalAlignment = .fill
//        button.imageView?.contentMode = .top
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var thirdFooterButton: UIButton = {
//
//        let button = UIButton(frame: CGRect(x: 0, y: 275, width: 200, height: 400))
//        button.footerImageButton()
//        button.backgroundColor = .white
//        button.setImage(UIImage(named: "ourCoreValues"), for: .normal)
//        button.contentHorizontalAlignment = .fill
//        button.contentVerticalAlignment = .fill
//        button.imageView?.contentMode = .left
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var buttonStack: UIStackView = {
//
//        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        stack.addArrangedSubview(firstFooterButton)
//        stack.addArrangedSubview(secondFooterButton)
//        stack.addArrangedSubview(thirdFooterButton)
//        stack.distribution = .equalSpacing
//        stack.alignment = .center
//        stack.axis = .vertical
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//
//    }()


//        NSLayoutConstraint.activate([
//
//            buttonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
//            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
//            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
//            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
//
//            firstFooterButton.widthAnchor.constraint(equalTo: buttonStack.widthAnchor),
//            firstFooterButton.heightAnchor.constraint(equalToConstant: 200),
//
//            secondFooterButton.heightAnchor.constraint(equalToConstant: 200),
//
//            thirdFooterButton.heightAnchor.constraint(equalToConstant: 200)
//
//            ])
