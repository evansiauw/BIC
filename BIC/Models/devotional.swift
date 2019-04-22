//
//  devotional.swift
//  BIC
//
//  Created by Iwan Siauw on 4/20/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

struct devotional {
    
    var title: String
    var description: String
    
    // need to be changed to convert to date (fireStamp to Date)
    var time: String
    var image: String
    
    var dictionary:[String:Any]{
        return [
            "title": title,
            "description": description,
            "time": time,
            "image": image
        ]
    }
    
}

extension devotional: DocumentSeriliazable{
    
    init?(Dictionary:[String:Any]){
        let title = Dictionary["title"] as? String ?? ""
        let description = Dictionary["description"] as? String ?? ""
        let time = Dictionary["time"] as? String ?? ""
        let image = Dictionary["image"] as? String ?? ""
        
        self.init(title: title, description: description, time: time, image: image)
        
    }
    
}
