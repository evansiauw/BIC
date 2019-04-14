//
//  ViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 3/25/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

// TODO: Need to fix delay content touches in TableView
import UIKit

class ViewController: UIViewController{
    
    var headerTitle = ["Announcement", "Upcoming Events", "Verse of the Day", "Testimony", "Weekly Message", "Monthly Theme"]
    
    lazy var titleImage: UIImageView = {

        let image = UIImageView()
        image.image = UIImage(named: "titleText")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var tableView: UITableView = {
        
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tv.register(mainTableViewCell.self, forCellReuseIdentifier: "cell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
//        tv.delaysContentTouches = false
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 300
        
        return tv
    }()
    
    lazy var containerFooterView: UIView = {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 400))
        view.backgroundColor = UIColor(rgb: 0xf6f6f6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var firstFooterButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 20, y: 25, width: containerFooterView.frame.width - 40, height: 100))
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
        
        let button = UIButton(frame: CGRect(x: 20, y: 150, width: containerFooterView.frame.width - 40, height: 100))
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
        
        let button = UIButton(frame: CGRect(x: 20, y: 275, width: containerFooterView.frame.width - 40, height: 100))
        button.footerImageButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "ourCoreValues"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .left
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
        navigationItem.titleView = titleImage
        
        // Left Bar Menu Button
        let hamburgerImage = UIImage(named: "hamburgerMenu")
        let sideMenuButton = UIBarButtonItem(image: hamburgerImage, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = sideMenuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        // Right Bar Menu Button
        let profileImage = UIImage(named: "profileMenu")
        let profileMenuButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileButtonClicked))
        navigationItem.rightBarButtonItem = profileMenuButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // Present Profile View
    @objc func profileButtonClicked(){
        
        if let profileView = UIStoryboard.profileViewController(){
            self.navigationController?.pushViewController(profileView, animated: true)
//            self.present(profileView, animated: true, completion: nil)
        }
    }
    
    // Main Screen setup
    func mainScreen(){
    
        view.addSubview(tableView)
        tableView.tableFooterView = containerFooterView
        containerFooterView.addSubview(firstFooterButton)
        containerFooterView.addSubview(secondFooterButton)
        containerFooterView.addSubview(thirdFooterButton)
        
    
    }

}


//lazy var firstFooterText: UITextField = {
//
//    let text = UITextField(frame: CGRect(x: 0, y: 0, width: firstFooterImage.frame.width, height: firstFooterImage.frame.height))
//    text.text = "OUR VISION"
//    text.textColor = .gray
//    text.font = UIFont(name: "System", size: 20)
//    return text
//}()

