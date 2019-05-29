//
//  profileViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 3/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profileWallpaper")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.circleProfile()
        image.image = UIImage(named: "profileImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    // Random button
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancelButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Scroll View
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        let screenSize = UIScreen.main.bounds
        scrollView.contentSize = CGSize(width: screenSize.width, height: 2000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        self.view.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileImage.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -75)
            ])
        
        self.view.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            dismissButton.widthAnchor.constraint(equalToConstant: 35),
            dismissButton.heightAnchor.constraint(equalToConstant: 35)
            ])
        
    }
    
    
    @objc func dismissView(){
        self.navigationController?.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    
}
