//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/17.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
  
  var param: NSDictionary!
  
  @IBOutlet weak var map: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dump("\n---------- [ Log : \(param) ] ----------\n")
    
    self.navigationItem.title = self.param["상영관명"] as? String
    
    let lat = (param?["위도"] as! NSString).doubleValue
    let lng = (param?["경도"] as! NSString).doubleValue
    
    print("\n---------- [ \(lat) ] ----------\n")
    print("\n---------- [ \(lng) ] ----------\n")
    
    let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    
    let regionRadius: CLLocationDistance = 100
    
    let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    
    self.map.setRegion(coordinateRegion, animated: true)
    
    let point = MKPointAnnotation()
    point.coordinate = location
    
    self.map.addAnnotation(point)
  }
  
}
