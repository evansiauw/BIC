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
    static func profileStoryboard() -> UIStoryboard { return UIStoryboard(name: "profile", bundle: Bundle.main) }
    
    
    
    static func mainViewController() -> ViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "mainView") as? ViewController
    }
    static func profileViewController() -> profileViewController? {
        return profileStoryboard().instantiateViewController(withIdentifier: "profileView") as? profileViewController
    }
    
    

    
}
