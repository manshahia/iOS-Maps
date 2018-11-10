//
//  ViewController.swift
//  Map
//
//  Created by Ravi Inder Manshahia on 10/11/18.
//  Copyright © 2018 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longitude : CLLocationDegrees = 27.1750
        let latitude : CLLocationDegrees = 78.0422
        let longDelta : CLLocationDegrees = 0.05
        let latDelta  : CLLocationDegrees = 0.05
        
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let locCOr : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: longitude, longitude: latitude)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: locCOr, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        annotation.subtitle = "I have been here.."
        annotation.coordinate = locCOr
        
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecogniser:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
    }

    @objc func longPress(gestureRecogniser : UIGestureRecognizer)
    {
        let touchPoint = gestureRecogniser.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.title = "New place"
        annotation.subtitle = "I Will go here"
        annotation.coordinate = coordinate
        
        map.addAnnotation(annotation)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

