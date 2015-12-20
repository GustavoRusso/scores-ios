import Foundation
import UIKit
import CoreLocation;

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    }
  
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didVisit visit: CLVisit) {
        if visit.departureDate.isEqualToDate(NSDate.distantFuture()) {
            print("arrival at lat: \(visit.coordinate.latitude) long: \(visit.coordinate.longitude)")
        } else {
            print("departure from lat: \(visit.coordinate.latitude) long: \(visit.coordinate.longitude)")
        }
    }
    
}