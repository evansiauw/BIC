//
//  ViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 3/25/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import InteractiveSideMenu

/* TODO:
-
-
*/


// RETURN TABLE VIEW'S SECTION RAW VALUE
enum TableSections: Int {

    case announcements
    case events
    case devotionals
    case testimonies
    
}

class ViewController: MenuContainerViewController, SideMenuItemContent{
    
    // REFERENCE TO FIRESTORE DATABASE
    var db: Firestore!
    
    
    
    // TABLE VIEW SECTION PROPERTIES
    // Device's screen width
    lazy var screenWidth: CGFloat = UIScreen.main.bounds.width
    // Table View's sections name
    let tableViewTitle = ["Announcements", "Upcoming Events", "Weekly Devotional", "Testimonies"]
    // Specify the width of tableView's cell on each section
    lazy var tableViewWidth: [CGFloat] = [screenWidth/1.1, screenWidth/2.2, screenWidth/2.5, screenWidth/2.5]
    // specify the height of tableView's cell on each setion
    let tableViewHeight: [CGFloat] = [230,280,170,170]
    

    
    // TABLE VIEW MODEL
    // Reload each tableView's section upon receiving data
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
    
    
    // PROPERTIES
    lazy var titleImage: UIImageView = {

        let image = UIImageView()
        image.image = UIImage(named: "titleText")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        refresh.tintColor = UIColor(red: 27, green: 20, blue: 100)
//        refresh.attributedTitle = NSAttributedString(string: "Fetching Latest Data ...")
        return refresh
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
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width * 3, height: 100))
        view.backgroundColor = .red
//        view.backgroundColor = UIColor(rgb: 0xf6f6f6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var footerViewScrollView: UIScrollView = {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width:view.frame.width * 3, height: containerFooterView.frame.height))
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
    
    
    // VIEW DID LOAD
    override func viewDidLoad(){
        super.viewDidLoad()
                
        // Register custom tableView's section header
        self.tableView.register(headerMainTableView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        // Initialize Firestore Database
        db = Firestore.firestore()
        mainScreenSetup()
        loadTableView()
        sideMenuSetup()
    }
    
    
    
    // FUNCTIONS
    func mainScreenSetup(){
        
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
            
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
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
            
    func sideMenuSetup() {
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.transitionOptions = TransitionOptions(duration: 0.4, visibleContentWidth: screenSize.width / 6)
        
        // Instantiate menu view controller by identifier
        self.menuViewController = UIStoryboard.menuViewController()
        self.currentItemOptions.cornerRadius = 10.0
        
    }
        
    @objc func refreshTableView(){
        print("fetching and refreshing table view")
        loadTableView()
        refreshControl.endRefreshing()
        tableView.reloadData()
        
    }
    
}

