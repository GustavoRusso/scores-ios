import UIKit

class PageViewControllerDataSourceByIdentifiers: NSObject, UIPageViewControllerDataSource {

    var identifiersToPaginate: [String]
    
    weak var storyboard: UIStoryboard?
    
    init(fromStoryboard storyboard: UIStoryboard, identifiersToPaginate: [String]) {
        self.storyboard = storyboard
        self.identifiersToPaginate = identifiersToPaginate
    }
    
    func instantiateInitialPage() -> UIViewController {
        let firstPageIdentifier = identifiersToPaginate[identifiersToPaginate.indices.first!]
        return storyboard!.instantiateViewControllerWithIdentifier(firstPageIdentifier)
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                                   viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let idOfCurrentView = viewController.dynamicType.storyboardIdentifier
        let indexOfCurrentView = identifiersToPaginate.indexOf(idOfCurrentView)
        if(indexOfCurrentView == nil || indexOfCurrentView == 0) {return nil}
        let idOfBeforeView = identifiersToPaginate[indexOfCurrentView!-1]
        return storyboard!.instantiateViewControllerWithIdentifier(idOfBeforeView)
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                                   viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let idOfCurrentView = viewController.dynamicType.storyboardIdentifier
        let indexOfCurrentView = identifiersToPaginate.indexOf(idOfCurrentView)
        if(indexOfCurrentView == nil || indexOfCurrentView == identifiersToPaginate.count-1) {return nil}
        let idOfAfterView = identifiersToPaginate[indexOfCurrentView!+1]
        return storyboard!.instantiateViewControllerWithIdentifier(idOfAfterView)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return identifiersToPaginate.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return identifiersToPaginate.indices.first!
    }
}