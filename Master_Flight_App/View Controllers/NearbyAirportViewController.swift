//
//  RunwayDataViewController.swift
//  Master_Flight_App
//
//  Created by Gregory Boyd on 12/31/17.
//  Copyright © 2017 Gregory Boyd. All rights reserved.
//

import UIKit
import MapKit

/* Cecil Coordinates:
   30.220445 -81.887779
 
*/

class NearbyAirportViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    //Mark: Properties
    var coordinate2D = CLLocationCoordinate2DMake(30.220445, -81.887779)
    var locationManager = CLLocationManager()
    
    //Mark: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // Mark: Actions
    @IBAction func FindAirport(_ sender: UIButton) {
        setupCoreLocation()
    }
    
    //Mark: Instance Methods
    func updateMapRegion(rangeSpan: CLLocationDistance) -> Void {
        let region = MKCoordinateRegionMakeWithDistance(coordinate2D, rangeSpan, rangeSpan)
        mapView.region = region
    }
    // Mark: Location
    func setupCoreLocation(){
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedAlways:
            enableLocationServices()
        default:
            break
        }
    }
    func enableLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
            mapView.setUserTrackingMode(.follow, animated: true)
        }
    }
    func disableLocationServices() {
        locationManager.stopUpdatingLocation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateMapRegion(rangeSpan: 5000)
        mapView.delegate = self
        locationManager.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Location Manager delagates
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("Authorized")
        case .denied, .restricted:
            print("Not Authorized")
        default:
            break
        }
    }

}
