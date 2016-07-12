import UIKit

class ConfigureLocationPageViewController: UIPageViewController, UIPageViewControllerDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        var identifiersToPaginate: [String] = [String]()
        if(LocationIntroViewController.shouldBeInstantiated()) {
            identifiersToPaginate.append(LocationIntroViewController.storyboardIdentifier)
        }        
        identifiersToPaginate.append(LocationAuthorizationViewController.storyboardIdentifier)
        
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
