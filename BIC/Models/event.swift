//
//  event.swift
//  BIC
//
//  Created by Iwan Siauw on 4/20/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

struct event {
    
    var title: String
    var attendee: Int
    var image: String
    var description: String
    var address: String
    var eventTime: Double?
    
    var dictionary:[String:Any]{
        return [
            "title": title,
            "attendee": attendee,
            "image": image,
            "description": description,
            "address": address,
            "eventTime": eventTime
        ]
    }
    
}

extension event: DocumentSeriliazable{
    
    init?(Dictionary:[String:Any]){
            let title = Dictionary["title"] as? String ?? ""
            let attendee = Dictionary["attendee"] as? Int ?? 0
            let image = Dictionary["image"] as? String ?? ""
            let description = Dictionary["description"] as? String ?? ""
            let address = Dictionary["address"] as? String ?? ""
        
            // Need to display string if date not setup yet or user has to provide date regardless
            let eventTime = Dictionary["eventTime"] as? Double

        self.init(title: title, attendee: attendee, image: image, description: description, address: address, eventTime: eventTime)
        
    }
    
}
