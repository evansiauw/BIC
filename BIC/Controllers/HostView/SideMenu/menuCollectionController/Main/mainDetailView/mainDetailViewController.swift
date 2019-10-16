//
//  mainDetailViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 4/18/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class mainDetailViewController: UIViewController, SideMenuItemContent, Storyboardable{
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailText: UILabel!
    
    var image = UIImage(named: "noImage")
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.roundAllImageViewCorners()
        detailImage.image = image
        detailText.text = text
        
        

    }
    
}
