//
//  UIStoryboard.swift
//  BIC
//
//  Created by Iwan Siauw on 3/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    static func mainViewController() -> ViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "mainView") as? ViewController
    }
    
    
    static func menuViewController() -> menuTableViewController? {
        return menuStoryboard().instantiateViewController(withIdentifier: "menuView") as? menuTableViewController
    }
    static func menuStoryboard() -> UIStoryboard { return UIStoryboard(name: "menu", bundle: Bundle.main) }
    
    
    static func mainDetailViewController() -> mainDetailViewController? {
        return mainDetailStoryboard().instantiateViewController(withIdentifier: "mainDetailView") as? mainDetailViewController
    }
    static func mainDetailStoryboard() -> UIStoryboard { return UIStoryboard(name: "mainDetail", bundle: Bundle.main) }
    
    
    static func eventDetailViewController() -> eventDetailViewController? {
        return eventDetailStoryboard().instantiateViewController(withIdentifier: "eventDetailView") as? eventDetailViewController
    }
    static func eventDetailStoryboard() -> UIStoryboard { return UIStoryboard(name: "event", bundle: Bundle.main) }
    
    
    static func hostViewController() -> ViewController? {
        return hostStoryboard().instantiateViewController(withIdentifier: "host") as? ViewController
    }
    static func hostStoryboard() -> UIStoryboard { return UIStoryboard(name: "host", bundle: Bundle.main) }
    
    
    static func scheduleViewController() -> scheduleViewController? {
        return scheduleStoryboard().instantiateViewController(withIdentifier: "schedule") as? scheduleViewController
    }
    static func scheduleStoryboard() -> UIStoryboard { return UIStoryboard(name: "schedule", bundle: Bundle.main) }
    
    
    static func prayerViewController() -> prayerViewController? {
        return prayerStoryboard().instantiateViewController(withIdentifier: "prayer") as? prayerViewController
    }
    static func prayerStoryboard() -> UIStoryboard { return UIStoryboard(name: "prayer", bundle: Bundle.main) }
    
    
    static func donationViewController() -> donationViewController? {
        return donationStoryboard().instantiateViewController(withIdentifier: "donation") as? donationViewController
    }
    static func donationStoryboard() -> UIStoryboard { return UIStoryboard(name: "donation", bundle: Bundle.main) }
    
    
    static func settingViewController() -> settingViewController? {
        return settingStoryboard().instantiateViewController(withIdentifier: "setting") as? settingViewController
    }
    static func settingStoryboard() -> UIStoryboard { return UIStoryboard(name: "setting", bundle: Bundle.main) }
    
    
    static func aboutViewController() -> aboutViewController? {
        return aboutStoryboard().instantiateViewController(withIdentifier: "about") as? aboutViewController
    }
    static func aboutStoryboard() -> UIStoryboard { return UIStoryboard(name: "about", bundle: Bundle.main) }
    
    
    
    //    static func storyboardNavigationController(_ name: String) -> UIViewController {
    //        let storyboard = UIStoryboard(name: name, bundle: nil)
    //
    //        guard let nc = storyboard.instantiateViewController() as? UIViewController else {
    //            fatalError("Could not instantiate storyboard with name: \(name)")
    //        }
    //
    //        return nc
    //    }
    
    
    
    
}

