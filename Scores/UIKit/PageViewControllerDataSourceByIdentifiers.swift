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
        return storyboard!.instantiateViewController(withIdentifier: firstPageIdentifier)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let idOfCurrentView = viewController.dynamicType.storyboardIdentifier
        let indexOfCurrentView = identifiersToPaginate.index(of: idOfCurrentView)
        if(indexOfCurrentView == nil || indexOfCurrentView == 0) {return nil}
        let idOfBeforeView = identifiersToPaginate[indexOfCurrentView!-1]
        return storyboard!.instantiateViewController(withIdentifier: idOfBeforeView)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let idOfCurrentView = viewController.dynamicType.storyboardIdentifier
        let indexOfCurrentView = identifiersToPaginate.index(of: idOfCurrentView)
        if(indexOfCurrentView == nil || indexOfCurrentView == identifiersToPaginate.count-1) {return nil}
        let idOfAfterView = identifiersToPaginate[indexOfCurrentView!+1]
        return storyboard!.instantiateViewController(withIdentifier: idOfAfterView)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return identifiersToPaginate.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return identifiersToPaginate.indices.first!
    }
}
