import UIKit

class ConfigureLocationPageViewController: UIPageViewController, UIPageViewControllerDelegate  {
    
    var identifiersToPaginate: [String] {
        get {
            return [
                LocationIntroViewController.storyboardIdentifier,
                LocationAuthorizationViewController.storyboardIdentifier
            ]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let dataSourceByIdentifiers = PageViewControllerDataSourceByIdentifiers(fromStoryboard: storyboard!, identifiersToPaginate: identifiersToPaginate)
        self.dataSource = dataSourceByIdentifiers
        
        setViewControllers([dataSourceByIdentifiers.instantiateInitialPage()],
                           direction: UIPageViewControllerNavigationDirection.forward,
                           animated: false,
                           completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
