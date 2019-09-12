//
//  menuViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/8/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import InteractiveSideMenu

/**
 Menu controller is responsible for creating its content and showing/hiding menu using 'menuContainerViewController' property.
 */
class menuTableViewController: MenuViewController, Storyboardable {
    
    let menuItems = ["Home","Service Schedules","Submit a Prayer Request","Give a Donation","Report an Error", "About Us"]
    let menuItemIcons:[UIImage] = [UIImage(named: "home")!,UIImage(named: "schedule")!,UIImage(named: "pray")!,UIImage(named: "give")!,UIImage(named: "errorWhite")!,UIImage(named: "about")!]

    @IBOutlet weak var avatarImageViewCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    private var gradientLayer = CAGradientLayer()
    
    private var gradientApplied: Bool = false
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableView.ScrollPosition.none)
        
        avatarImageView.circleProfile()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        avatarImageViewCenterXConstraint.constant = -(menuContainerViewController?.transitionOptions.visibleContentWidth ?? 0.0)/2
        
        if gradientLayer.superlayer != nil {
            gradientLayer.removeFromSuperlayer()
        }
        
        let topColor = UIColor(red: 16.0/255.0, green: 12.0/255.0, blue: 54.0/255.0, alpha: 1.0)
        let bottomColor = UIColor(red: 57.0/255.0, green: 33.0/255.0, blue: 61.0/255.0, alpha: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    deinit{
        print()
    }
}

extension menuTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
//        return menuContainerViewController?.contentViewControllers.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? menuTableViewCell else {
            preconditionFailure("Unregistered table view cell")
        }

        cell.cellLabel.text = menuItems[indexPath.row]
        cell.cellImage.image = menuItemIcons[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        
        menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[indexPath.row])
        menuContainerViewController.hideSideMenu()

        
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        return v
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}

