//
//  eventDetailViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 4/18/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import MapKit

class eventDetailViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var attendee: UILabel!
    
    var titleText = ""
    var attendeeText = ""
    var dateText = "To be determined"
    let nycLocation = CLLocation(latitude: 40.745233, longitude: -73.997795)
    let regionRadius: CLLocationDistance = 10000

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText
        attendee.text = attendeeText
        dateLabel.text = dateText
        
        dateLabel.roundSomeLabelCorners(corners: [.topLeft, .topRight], radius: 10)
        attendee.roundSomeLabelCorners(corners: [.bottomLeft, .bottomRight], radius: 10)
        
        dateLabel.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        titleLabel.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        attendee.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        map.delegate = self
        centerMapOnLocation(location: nycLocation)
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }




}
