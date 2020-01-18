//
//  eventDetailViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 4/18/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth


/*
 TODO:
 
 */

class eventDetailViewController: UIViewController, MKMapViewDelegate{
    
    // OUTLETS
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var attendee: UILabel!
    @IBOutlet weak var textView: UITextView!
        
    // PROPERTIES
    lazy var goingButton: UIBarButtonItem = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "yes"), for: .normal)
        button.addTarget(self, action: #selector(going), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    lazy var notGoingButton: UIBarButtonItem = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "no"), for: .normal)
        button.addTarget(self, action: #selector(notGoing), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    
    var addressText = ""
    var stateText = ""
    var numOfAttendees = 0
    var dateText = ""
    var descriptionText = ""
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
                       
    lazy var location = CLLocation(latitude: latitude, longitude: longitude)
    let regionRadius: CLLocationDistance = 10000

    
    
    //  VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(location)
        
        titleLabel.text = addressText
        stateLabel.text = stateText
        
        let attendees = NSMutableAttributedString(string: "\(numOfAttendees)",
            attributes: [.foregroundColor: numOfAttendees == 0 ? UIColor.red : UIColor.init(red: 3, green: 125, blue: 80)])
        let attendeeString = NSMutableAttributedString(string: " People Going")
        attendees.append(attendeeString)
        attendee.attributedText = attendees
        
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
    
    @objc func going(){
        
        if Auth.auth().currentUser != nil {

            
        } else {
            
            guard let authVC = UIStoryboard.authViewController() else {
                return
            }
            self.present(authVC, animated: true, completion: nil)
            
            print("user is not signed in")

        }
        
    }
    
    @objc func notGoing(){
        
        if Auth.auth().currentUser != nil {
          
            
        } else {
            
            guard let authVC = UIStoryboard.authViewController() else {
                return
            }
            self.present(authVC, animated: true, completion: nil)
            
            print("user is not signed in")
        }
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
