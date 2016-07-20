import Foundation
import CoreLocation
import UIKit

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
  
    func isAllowed() -> Bool{
        if(!CLLocationManager.locationServicesEnabled()){ return false }

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined, .denied, .restricted:
            return false
        default:
            return true
        }
    }
    
    func authorizationStillHasToBeDetermined() -> Bool {
        return (CLLocationManager.authorizationStatus() == .notDetermined)
    }
    
    func requestAuthorization(requestedStatus: CLAuthorizationStatus) {
        
        if (authorizationStillHasToBeDetermined()) {
            switch requestedStatus {
                case .authorizedWhenInUse:
                    getCLLocationManager().requestWhenInUseAuthorization()
                case .authorizedAlways:
                    getCLLocationManager().requestAlwaysAuthorization()
                default:
                    break
            }
            return
        }
        
        if let appSettings = URL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.shared().open(appSettings, options: [String : AnyObject](), completionHandler: nil)
        }
    }
    
}
