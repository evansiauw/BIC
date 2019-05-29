//
//  eventDetailViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 4/18/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import MapKit

/*
 TODO:
 - lat and long need optional value not force unwrapping
 - lat and long not accurately displayed on map and pin
 
 */

class eventDetailViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var attendee: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    lazy var goingButton: UIBarButtonItem = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "yes"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    lazy var notGoingButton: UIBarButtonItem = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "no"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    var titleText = ""
    var attendeeText = ""
    var dateText = "To be Announced"
    var descriptionText = ""
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    
    lazy var location = CLLocation(latitude: latitude, longitude: longitude)
    let regionRadius: CLLocationDistance = 10000

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(location)
        
        titleLabel.text = titleText
        attendee.text = attendeeText
        dateLabel.text = dateText
        textView.text = descriptionText
        
        dateLabel.roundSomeLabelCorners(corners: [.topLeft, .topRight], radius: 10)
        attendee.roundSomeLabelCorners(corners: [.bottomLeft, .bottomRight], radius: 10)
        textView.roundSomeTextViewCorners(corners: [.topLeft, .bottomLeft, .bottomRight, .topRight], radius: 10)
    
        dateLabel.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        titleLabel.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        attendee.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        navigationItem.rightBarButtonItems = [notGoingButton,goingButton]

        
        map.delegate = self
        centerMapOnLocation(location: location)
        addPinToMap()
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func addPinToMap(){
        
        let london = MKPointAnnotation()
        london.title = "Ibu Diana"
        london.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        print(london.coordinate)
        map.addAnnotation(london)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

        // get the particular pin that was tapped
        let pinToZoomOn = view.annotation

        // optionally you can set your own boundaries of the zoom
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)

        // or use the current map zoom and just center the map
        // let span = mapView.region.span

        // now move the map
        let region = MKCoordinateRegion(center: pinToZoomOn!.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }




}
