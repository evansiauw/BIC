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
        collectionView.register(testimonyCollectionViewCell.self, forCellWithReuseIdentifier: "testimonyCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
//        collectionView.delegate = self
//        collectionView.dataSource = self
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

extension mainTableViewCell{
    
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }

}














//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }

