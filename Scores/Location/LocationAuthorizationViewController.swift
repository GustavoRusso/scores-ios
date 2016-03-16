import UIKit

class LocationAuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func goToSettings(sender: UIButton) {
        if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(appSettings)
        }
    }


}
