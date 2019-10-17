//
//  prayerViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/9/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

/*
 -  Prayer title TextField issue, line doesnt go all the way to end (trailing)
 
 
 
 
 */

import UIKit
import FirebaseFirestore
import FirebaseAuth
import SwiftEntryKit

class prayerViewController: UIViewController {
    
    @IBOutlet weak var prayerTitle: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        prayerTitle.underlined()
                
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.darkGray.cgColor
        descriptionTextView.layer.cornerRadius = 5.0
        
        submitButton.roundAllButtonCorners()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPrayers(_ sender: UIButton) {
        
        guard let title = prayerTitle.text, let desc = descriptionTextView.text, !title.isEmpty, !desc.isEmpty else {
            print("Please fill out all required columns")
            EmptyFieldAlert()
            return
        }
        
        var ref: DocumentReference? = nil

        ref = db.collection("Prayer Requests").addDocument(data: [
            "title": title,
            "desc": desc
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.prayerTitle.text = ""
                self.descriptionTextView.text = ""
                print("Document added with ID: \(ref!.documentID)")
                self.successAlert()

            }
        }
    }
    
    func EmptyFieldAlert(){
        
//         Generate top floating entry and set some properties
        var attributes = EKAttributes.topNote
        attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(UIColor.red), EKColor(UIColor.orange)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.8, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        //            attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.minEdge), height: .intrinsic)
        
        let title = EKProperty.LabelContent(text: "Error!!!", style: .init(font: UIFont.systemFont(ofSize: 16, weight: .heavy), color: EKColor(UIColor.white)))
        let description = EKProperty.LabelContent(text: "Please fill out all required columns", style: .init(font: UIFont.systemFont(ofSize: 13, weight: .bold), color: EKColor(UIColor.white)))
        let image = EKProperty.ImageContent(image: UIImage(named: "errorWhite")!, size: CGSize(width: 50, height: 50))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    func successAlert(){
        
//         Generate top floating entry and set some properties
        var attributes = EKAttributes.topNote
        attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(UIColor.blue), EKColor(UIColor.green)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.8, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.displayDuration = 8
        //            attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.minEdge), height: .intrinsic)
        
        let title = EKProperty.LabelContent(text: "Success!!!", style: .init(font: UIFont.systemFont(ofSize: 16, weight: .heavy), color: EKColor(UIColor.white)))
        let description = EKProperty.LabelContent(text: "Mark 11:24 Therefore I tell you, whatever you ask in prayer, believe that you have received it, and it will be yours.", style: .init(font: UIFont.systemFont(ofSize: 13, weight: .bold), color: EKColor(UIColor.white)))
        let image = EKProperty.ImageContent(image: UIImage(named: "successWhite")!, size: CGSize(width: 50, height: 50))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
    
    
}
