//
//  menuTableViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 5/8/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class menuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectedView.backgroundColor = selected ? UIColor.green : UIColor.clear
        cellLabel.textColor = selected ? UIColor.green : UIColor.white
    }
}

