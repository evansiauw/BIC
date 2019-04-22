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
    
    // need to be changed to convert to date (fireStamp to Date)
    var eventTime: String
    
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
            let eventTime = Dictionary["eventTime"] as? String ?? ""

        self.init(title: title, attendee: attendee, image: image, description: description, address: address, eventTime: eventTime)
        
    }
    
}
