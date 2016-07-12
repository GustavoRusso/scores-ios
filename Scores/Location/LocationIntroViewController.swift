import UIKit

class LocationIntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goToSettings(_ sender: UIButton) {
        if let appSettings = URL(string: "prefs:root=LOCATION_SERVICES") {
            UIApplication.shared().open(appSettings, options: [String : AnyObject](), completionHandler: nil)
        }
    }
}
