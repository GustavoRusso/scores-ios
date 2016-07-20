import UIKit

class LocationAuthorizationViewController: UIViewController, OptionallyInstantiable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    static func shouldBeInstantiated() -> Bool {
        return !LocationManager().isAllowed()
    }
    
    @IBAction func requestAlwaysAuthorization(_ sender: UIButton) {
        LocationManager().requestAuthorization(requestedStatus: .authorizedAlways)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func requestWhenInUseAuthorization(_ sender: UIButton) {
        LocationManager().requestAuthorization(requestedStatus: .authorizedWhenInUse)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func notNow(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
