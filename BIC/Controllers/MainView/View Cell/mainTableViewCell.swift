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
        layout.itemSize = CGSize(width: self.frame.width / 2.5, height: self.frame.width / 2)
        
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(mainCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
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

extension mainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as! mainCollectionViewCell
        
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        <#code#>
//    }
//
    

}











//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        print(indexPath.row)
//        if indexPath.row % 2 == 0{
//            return CGSize(width: 125, height: 125)
//        } else {
//            return CGSize(width: 75, height: 75)
//        }
//
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }

