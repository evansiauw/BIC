//
//  HostViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/11/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//
import UIKit
import InteractiveSideMenu

class HostViewController: MenuContainerViewController {
    
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

        // Gather content items controllers
        self.contentViewControllers = contentControllers()
//        
//         Select initial content controller. It's needed even if the first view controller should be selected.
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
        
        // Left Bar Menu Button
        let hamburgerImage = UIImage(named: "hamburgerMenu")
        let sideMenuButton = UIBarButtonItem(image: hamburgerImage, style: .plain, target: self, action: #selector(menuButtonClicked))
        navigationItem.leftBarButtonItem = sideMenuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        // Right Bar Menu Button
        let infoImage = UIImage(named: "about")
        let profileMenuButton = UIBarButtonItem(image: infoImage, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = profileMenuButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func menuButtonClicked(){
        showSideMenu()
    }
    
    // Present Profile View
    @objc func profileButtonClicked(){
        
        if let profileView = UIStoryboard.profileViewController(){
            //            self.navigationController?.pushViewController(profileView, animated: true)
            self.present(profileView, animated: true, completion: nil)
        }
    }
    
    private func contentControllers() -> [UIViewController] {
        
        let mainController = UIStoryboard.hostViewController()
        let scheduleController = UIStoryboard.scheduleViewController()
        let prayerController = UIStoryboard.prayerViewController()
        let donationController = UIStoryboard.donationViewController()
        let settingController = UIStoryboard.settingViewController()
//        let scheduleController = UIStoryboard.storyboardNavigationController("schedule")
//        let prayerController = UIStoryboard.storyboardNavigationController("prayer")
//        let donationController = UIStoryboard.storyboardNavigationController("donation")
//        let settingController = UIStoryboard.storyboardNavigationController("setting")
        
        return [mainController!, scheduleController!, prayerController!, donationController!, settingController!, settingController!]

    }
}
