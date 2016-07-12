import Foundation
import UIKit
import CoreLocation;

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    }
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        if visit.departureDate == Date.distantFuture {
            print("arrival at lat: \(visit.coordinate.latitude) long: \(visit.coordinate.longitude)")
        } else {
            print("departure from lat: \(visit.coordinate.latitude) long: \(visit.coordinate.longitude)")
        }
    }
    
}
