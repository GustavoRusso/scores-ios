import UIKit

class LocationAuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func goToSettings(_ sender: UIButton) {
        if let appSettings = URL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.shared().open(appSettings, options: [String : AnyObject](), completionHandler: nil)
        }
    }

}
