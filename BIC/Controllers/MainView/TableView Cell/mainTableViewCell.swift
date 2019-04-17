//
//  topTableViewCell.swift
//  BIC
//
//  Created by Iwan Siauw on 3/27/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class mainTableViewCell: UITableViewCell {

    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.estimatedItemSize = CGSize(width: self.frame.width, height: 250)
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(announcementCollectionViewCell.self, forCellWithReuseIdentifier: "announcementCollectionViewCell")
        collectionView.register(eventCollectionViewCell.self, forCellWithReuseIdentifier: "eventCollectionViewCell")
        collectionView.register(mainCollectionViewCell.self, forCellWithReuseIdentifier: "mainCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(collectionView)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}

extension mainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            return 3
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {

            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "announcementCollectionViewCell", for: indexPath as IndexPath) as! announcementCollectionViewCell
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell

        } else if collectionView.tag == 1 {
        
            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCollectionViewCell", for: indexPath as IndexPath) as! eventCollectionViewCell
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
            
        } else {
            
            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionViewCell", for: indexPath as IndexPath) as! mainCollectionViewCell
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if self.collectionView.tag == 0 {
            return CGSize(width: self.frame.width / 1.2, height: self.frame.height)
        } else if self.collectionView.tag == 1{
            return CGSize(width: self.frame.width / 2, height: self.frame.height)
        } else {
            return CGSize(width: self.frame.width / 2.5, height: self.frame.height)
        }

    }
    
}














//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }

