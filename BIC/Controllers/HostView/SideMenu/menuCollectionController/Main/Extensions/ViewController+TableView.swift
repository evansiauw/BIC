//
//  ViewController+TableView.swift
//  BIC
//
//  Created by Iwan Siauw on 3/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

extension ViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewTitle.count
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                    "sectionHeader") as! headerMainTableView
        view.tintColor = .white
        view.title.text = tableViewTitle[section]
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewHeight[indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableViewCell
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0 :
            return announcements.count
        case 1 :
            return events.count
        case 2 :
            return devotionals.count
        case 3 :
            return testimonies.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "announcementCollectionViewCell", for: indexPath as IndexPath) as! announcementCollectionViewCell
            cell.titleLabel.text = announcements[indexPath.item].title
            
            if let imageRef = announcements[indexPath.item].image {

                let httpRef = Storage.storage().reference(forURL: imageRef)

                httpRef.getData(maxSize: 1 * 1024 * 1024, completion: { data, error in
                    if let error = error {
                        print(error)
                    } else {

                        DispatchQueue.main.async {
                            cell.cellImage.image = UIImage(data: data!)
                        }
                    }
                })
            }
            
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
            
        } else if collectionView.tag == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCollectionViewCell", for: indexPath as IndexPath) as! eventCollectionViewCell
            cell.titleLabel.text = events[indexPath.item].title
            
            let numOfAttendees = events[indexPath.item].attendee
            let attendees = NSMutableAttributedString(string: "\(numOfAttendees)",
                attributes: [.foregroundColor: numOfAttendees == 0 ? UIColor.red : UIColor.init(red: 3, green: 125, blue: 80)])
            let attendeeString = NSMutableAttributedString(string: " People Going")
            attendees.append(attendeeString)

            cell.attendeesLabel.attributedText = attendees
            
            if let timeStamp = events[indexPath.item].eventTime{
                let date = Date(timeIntervalSince1970: timeStamp / 1000)
                
                let dateFormatter = DateFormatter()
                dateFormatter.timeZone = NSTimeZone.local
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .short
                cell.dateLabel.text = dateFormatter.string(from: date as Date)
            }
            
            if let imageRef = events[indexPath.item].image {

                let httpRef = Storage.storage().reference(forURL: imageRef)

                httpRef.getData(maxSize: 1 * 1024 * 1024, completion: { data, error in
                    if let error = error {
                        print(error)
                    } else {

                        DispatchQueue.main.async {
                            cell.cellImage.image = UIImage(data: data!)
                        }
                    }
                })
            }
            
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
            
        } else if collectionView.tag == 2{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCollectionViewCell", for: indexPath as IndexPath) as! mainCollectionViewCell
            cell.titleLabel.text = devotionals[indexPath.item].title
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonyCollectionViewCell", for: indexPath as IndexPath) as! testimonyCollectionViewCell
            cell.titleLabel.text = testimonies[indexPath.item].title
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch (collectionView.tag)   {
            
        case 0:
            if let announcementDetail = UIStoryboard.mainDetailViewController(){

                let cell = collectionView.cellForItem(at: indexPath) as! announcementCollectionViewCell
                announcementDetail.image = cell.cellImage.image
                announcementDetail.text = announcements[indexPath.item].description
                announcementDetail.navigationItem.title = cell.titleLabel.text
                self.navigationController?.pushViewController(announcementDetail, animated: true)
            }
        case 1:
            if let eventDetail = UIStoryboard.eventDetailViewController(){

                if let timeStamp = events[indexPath.item].eventTime{
                    let date = Date(timeIntervalSince1970: timeStamp / 1000)

                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = NSTimeZone.local
                    dateFormatter.dateStyle = .long
                    dateFormatter.timeStyle = .short
                    eventDetail.dateText = dateFormatter.string(from: date as Date)
                }

//                eventDetail.titleText = events[indexPath.item].title
                eventDetail.numOfAttendees = events[indexPath.item].attendee
                eventDetail.descriptionText = events[indexPath.item].description
                eventDetail.navigationItem.title = events[indexPath.item].title
                eventDetail.latitude = events[indexPath.item].latitude
                eventDetail.longitude = events[indexPath.item].longitude

                self.navigationController?.pushViewController(eventDetail, animated: true)
            }
            
        case 2:
            if let mainDetail = UIStoryboard.mainDetailViewController(){

                let cell = collectionView.cellForItem(at: indexPath) as! mainCollectionViewCell
                mainDetail.image = cell.cellImage.image
                mainDetail.text = devotionals[indexPath.item].description
                mainDetail.navigationItem.title = cell.titleLabel.text
                self.navigationController?.pushViewController(mainDetail, animated: true)
            }
            
        case 3:
            if let testimonyDetail = UIStoryboard.mainDetailViewController(){
                
                let cell = collectionView.cellForItem(at: indexPath) as! testimonyCollectionViewCell
                testimonyDetail.image = cell.cellImage.image
                testimonyDetail.text = testimonies[indexPath.item].description
                testimonyDetail.navigationItem.title = cell.titleLabel.text
                self.navigationController?.pushViewController(testimonyDetail, animated: true)
            }
            
        default:
            if let mainDetail = UIStoryboard.mainDetailViewController(){
                self.navigationController?.pushViewController(mainDetail, animated: true)
            }
        }

        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = tableViewWidth[collectionView.tag]
        let height = tableViewHeight[collectionView.tag]
        return CGSize(width: width, height: height)

    }
    
}
















//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        print("table view will display for row at")
//        guard let tableViewCell = cell as? mainTableViewCell else { return }
//        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
//
//    }

//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//        print("collection will display")
//        switch collectionView.tag {
//
//        case 0 :
//            guard let announcementViewCell = cell as? announcementCollectionViewCell else { return }
//            announcementViewCell.titleLabel.text = announcements[indexPath.item].title
//        case 1 :
//            guard let eventViewCell = cell as? eventCollectionViewCell else { return }
//            eventViewCell.titleLabel.text = events[indexPath.item].title
//        case 2 :
//            guard let mainViewCell = cell as? mainCollectionViewCell else { return }
//            mainViewCell.titleLabel.text = devotionals[indexPath.item].title
//        case 3 :
//            guard let testimonyViewCell = cell as? testimonyCollectionViewCell else { return }
//            testimonyViewCell.titleLabel.text = testimonies[indexPath.item].title
//        default : break
//        }
//
//    }


//    func selectedItem(tag: Int, item: Int) {
//
//        print("tag# is \(tag) and item# is \(item)")
//
//        switch (tag)   {
//
//        case 1:
//            if let eventDetail = UIStoryboard.eventDetailViewController(){
//
//                self.navigationController?.pushViewController(eventDetail, animated: true)
//            }
//        default:
//            if let mainDetail = UIStoryboard.mainDetailViewController(){
//
//                self.navigationController?.pushViewController(mainDetail, animated: true)
//            }
//        }
//
//    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        switch (segue.identifier)   {
//        case "announcement":
//        case "event":
//            print("prepare for segue to eventDetailViewController")
//            let vc = segue.destination as! eventDetailViewController
//        case "main":
//            let vc
//        case "testimony":
//            let vc
//        default:
//            print("break")
//            break
//        }


//        print("this is indexpath.row in will display \(indexPath.section)")
//        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)

//        cell.delegate = self
//        cell.layoutIfNeeded()
//        cell.collectionView.tag = indexPath.section
//        cell.collectionView.reloadData()


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
