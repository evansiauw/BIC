//
//  ViewController+TableView.swift
//  BIC
//
//  Created by Iwan Siauw on 3/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableViewCell
        
        cell.layoutIfNeeded()
        cell.collectionView.tag = indexPath.section
        cell.collectionView.reloadData()
//        cell.collectionView.collectionViewLayout.invalidateLayout()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let title = headerTitle[section]
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 0 {
            return 230
        } else if indexPath.section == 1 {
            return 250
        } else {
            return 180
        }
    }
    

}


























//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        let collectionView = mainTableViewCell()
//        let flowLayout = collectionView.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        flowLayout.itemSize = CGSize(width: 500, height: 500)
//    }
//
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        guard let tableViewcell = cell as? mainTableViewCell else { return }
//        tableViewcell.collectionView.reloadData()
////        cell.collectionView.collectionViewLayout.invalidateLayout()
//        print("*******************************************")
//    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
//        headerView.backgroundColor = .gray
//        return headerView
//    }

//    func touchesShouldCancel(in view: UIView) -> Bool {
//
//        if view is UIControl
//            && !(view is UITextInput)
//            && !(view is UISlider)
//            && !(view is UISwitch) {
//            return true
//        }
//
//        return false
////        return super.touchesShouldCancel(in: view)
//    }

//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        guard let tableViewCell = cell as? mainTableViewCell else { return }
//
//        tableViewCell.collectionView.tag = indexPath.section
//
//        print("indexPathSection on will display cell \(indexPath.section)")
//    }
