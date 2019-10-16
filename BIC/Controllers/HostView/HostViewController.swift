//
//  HostViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/11/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//
import UIKit
import InteractiveSideMenu

/* TODO:
 - Need to fix the cursor on selected menu option when home button pressed
 -
 -
 */

class HostViewController: MenuContainerViewController{
    
    lazy var titleImage: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "titleText")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        print("hostViewController run")
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.transitionOptions = TransitionOptions(duration: 0.4, visibleContentWidth: screenSize.width / 6)
        
        // Instantiate menu view controller by identifier
        self.menuViewController = UIStoryboard.menuViewController()
        self.menuViewController.modalPresentationStyle = .fullScreen

        // Gather content items controllers
        self.contentViewControllers = contentControllers()
       
        // Select initial content controller. It's needed even if the first view controller should be selected.
        self.selectContentViewController(contentViewControllers.first!)
        
        self.currentItemOptions.cornerRadius = 10.0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // Options to customize menu transition animation.
        var options = TransitionOptions()
        
        // Animation duration
        options.duration = size.width < size.height ? 0.4 : 0.6
        
        // Part of item content remaining visible on right when menu is shown
        options.visibleContentWidth = size.width / 6
        self.transitionOptions = options
    }
    
    // Navigation bar setup on the main screen
    func navigationBar(){
        
        // Navigation Item
        navigationItem.titleView = titleImage
        
        // Custom Navigaton Bar Tint Color
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 27, green: 20, blue: 100)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : UIColor.init(red: 27, green: 20, blue: 100),
             NSAttributedString.Key.font: UIFont(name: "DIN CONDENSED", size: 23.0)!]
        
        // Left Bar Menu Button
        let hamburgerImage = UIImage(named: "hamburgerMenu")
        let sideMenuButton = UIBarButtonItem(image: hamburgerImage, style: .plain, target: self, action: #selector(menuButtonClicked))
        navigationItem.leftBarButtonItem = sideMenuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        // Custom Back Button Image
        let BackArrowImage = UIImage(named: "doubleBackArrow")
        self.navigationController?.navigationBar.backIndicatorImage = BackArrowImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = BackArrowImage
        
        // Right Bar Menu Button
        let homeImage = UIImage(named: "homeBlack")
        let profileMenuButton = UIBarButtonItem(image: homeImage, style: .plain, target: self, action: #selector(homeButtonClicked))
        navigationItem.rightBarButtonItem = profileMenuButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func menuButtonClicked(){
        showSideMenu()
    }
    
    @objc func homeButtonClicked(){
        
        print("Navigating to home screen")
        self.selectContentViewController(contentViewControllers.first!)

    }
    
    private func contentControllers() -> [UIViewController] {
        
        let mainController = UIStoryboard.hostViewController()
        let scheduleController = UIStoryboard.scheduleViewController()
        let prayerController = UIStoryboard.prayerViewController()
        let donationController = UIStoryboard.donationViewController()
        let errorController = UIStoryboard.errorViewController()
        let aboutController = UIStoryboard.aboutViewController()
        
        return [mainController!, scheduleController!, prayerController!, donationController!, errorController!, aboutController!]

    }
}


//        if let profileView = UIStoryboard.profileViewController(){
//            //            self.navigationController?.pushViewController(profileView, animated: true)
//            self.present(profileView, animated: true, completion: nil)
//        }
