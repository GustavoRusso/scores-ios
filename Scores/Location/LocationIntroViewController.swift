import UIKit

class LocationIntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goToSettings(sender: UIButton) {
        if let appSettings = NSURL(string: "prefs:root=LOCATION_SERVICES") {
            UIApplication.sharedApplication().openURL(appSettings)
        }
    }
}
