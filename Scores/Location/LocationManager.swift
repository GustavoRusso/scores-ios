import Foundation
import CoreLocation

class LocationManager {
    
    private static let sharedLocationManager: CLLocationManager = CLLocationManager()
    
    func getCLLocationManager() -> CLLocationManager {
        if(LocationManager.sharedLocationManager.delegate == nil){
            LocationManager.sharedLocationManager.delegate = LocationManager.sharedLocationManagerDelegate
        }
        return LocationManager.sharedLocationManager;
    }
    
    private static let sharedLocationManagerDelegate: LocationManagerDelegate = LocationManagerDelegate()
    
    func getLocationManagerDelegate() -> CLLocationManagerDelegate {
        return getCLLocationManager().delegate!;
    }
  
    func isProperlyConfigured() -> Bool{
        if(!CLLocationManager.locationServicesEnabled()){ return false }

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined, .denied, .restricted:
            return false
        default:
            return true
        }
    }
    
}
