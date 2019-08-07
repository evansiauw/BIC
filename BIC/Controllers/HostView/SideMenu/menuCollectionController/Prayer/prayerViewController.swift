//
//  prayerViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/9/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

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
        
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor.darkGray.cgColor
        
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
                print("Document added with ID: \(ref!.documentID)")
                self.prayerTitle.text = ""
                self.descriptionTextView.text = ""
            }
        }
    }
    
    func EmptyFieldAlert(){
        
        // Generate top floating entry and set some properties
        var attributes = EKAttributes.topNote
        attributes.entryBackground = .gradient(gradient: .init(colors: [UIColor.red, UIColor.orange], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        //            attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.minEdge), height: .intrinsic)
        
        let title = EKProperty.LabelContent(text: "Error!!!", style: .init(font: UIFont.systemFont(ofSize: 16, weight: .heavy), color: UIColor.white))
        let description = EKProperty.LabelContent(text: "Please Fill out all required columns", style: .init(font: UIFont.systemFont(ofSize: 13, weight: .bold), color: UIColor.white))
        let simpleMessage = EKSimpleMessage(title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    
}
