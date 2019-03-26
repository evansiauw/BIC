//
//  ViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 3/25/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Scroll View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        let screenSize = UIScreen.main.bounds
        scrollView.contentSize = CGSize(width: screenSize.width, height: 2000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // Random button
    let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        mainScreen()
    }
   
    // Navigation bar setup on the main screen
    func navigationBar(){
        
        // Navigation Item
        navigationItem.title = "Bethel International Church"
        
        // Left Bar Menu Button
        let hamburgerImage = UIImage(named: "hamburgerMenu")
        let sideMenuButton = UIBarButtonItem(image: hamburgerImage, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = sideMenuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        // Right Bar Menu Button
        let profileImage = UIImage(named: "profileMenu")
        let profileMenuButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = profileMenuButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // Main Screen setup
    func mainScreen(){
        
        // Scroll View
        self.view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        scrollView.addSubview(randomButton)
        
    }
    


}

