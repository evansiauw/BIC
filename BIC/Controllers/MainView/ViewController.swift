//
//  ViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 3/25/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import Firebase

enum TableSections: Int {

    case announcements
    case events
    case devotionals
    case testimonies
    
}

class ViewController: UIViewController{
    
    var db: Firestore!
    
    // TableView Sections Properties
    lazy var screenSize: CGFloat = UIScreen.main.bounds.width
    let tableViewTitle = ["Announcements", "Upcoming Events", "Weekly Devotional", "Testimonies"]
    lazy var tableViewWidth: [CGFloat] = [screenSize/1.1, screenSize/2.2, screenSize/2.5, screenSize/2.5]
    let tableViewHeight: [CGFloat] = [230,300,170,170]

    // TableView Models
    var announcements: [announcement] = [] {
        didSet {
            tableView.reloadSections([TableSections.announcements.rawValue], with: .fade)
        }
    }
    var events:  [event] = [] {
        didSet {
            tableView.reloadSections([TableSections.events.rawValue], with: .fade)
        }
    }
    var devotionals: [devotional] = [] {
        didSet {
            tableView.reloadSections([TableSections.devotionals.rawValue], with: .fade)

        }
    }

    var testimonies: [testimony] = [] {
        didSet {
            tableView.reloadSections([TableSections.testimonies.rawValue], with: .fade)
        }
    }
    
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
        tv.estimatedRowHeight = 250
        tv.rowHeight = UITableView.automaticDimension
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
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        db = Firestore.firestore()
        loadTableView()
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
//            self.navigationController?.pushViewController(profileView, animated: true)
            self.present(profileView, animated: true, completion: nil)
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
    
    
    func loadTableView() {

        for title in tableViewTitle{

            let sectionName = title
            db.collection(sectionName).getDocuments(){ DocumentSnapshot, error in

                guard let doc = DocumentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }

                switch sectionName {

                case "Announcements" :
                    self.announcements = doc.documents.compactMap({announcement(Dictionary: $0.data())})
                case "Upcoming Events" :
                    self.events = doc.documents.compactMap({event(Dictionary: $0.data())})
                case "Weekly Devotional" :
                    self.devotionals = doc.documents.compactMap({devotional(Dictionary: $0.data())})
                case "Testimonies" :
                    self.testimonies = doc.documents.compactMap({testimony(Dictionary: $0.data())})
                default:
                    break
                }
            }
        }

    }
    
    

}


































//    func createData(){
//
//        let docData: [String: Any] = [
//
//            "title": "test",
//            "description": "test",
//            "image": "test",
//            "time": Timestamp(date: Date())
//        ]
//
//        let eventdocData: [String: Any] = [
//
//            "title": "test",
//            "description": "test",
//            "image": "test",
//            "eventTime": Timestamp(date: Date()),
//            "attendee": 50,
//            "address": "test"
//        ]
//
//        for _ in 1...6 {
//            db.collection("Weekly Devotional").document().setData(docData){ err in
//
//                if let err = err {
//                    print("Error writing to document: \(err)")
//                } else {
//                    print("Document sucessfully written!")
//                }
//
//            }
//        }
//
//        for _ in 1...6 {
//            db.collection("Announcements").document().setData(docData){ err in
//
//                if let err = err {
//                    print("Error writing to document: \(err)")
//                } else {
//                    print("Document sucessfully written!")
//                }
//
//            }
//        }
//
//
//        for _ in 1...6 {
//            db.collection("Upcoming Events").document().setData(eventdocData){ err in
//
//                if let err = err {
//                    print("Error writing to document: \(err)")
//                } else {
//                    print("Document sucessfully written!")
//                }
//
//            }
//        }
//
//
//        for _ in 1...6 {
//            db.collection("Testimonies").document().setData(docData){ err in
//
//                if let err = err {
//                    print("Error writing to document: \(err)")
//                } else {
//                    print("Document sucessfully written!")
//                }
//
//            }
//        }
//    }
//
