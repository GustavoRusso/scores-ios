import UIKit

class ConfigureLocationPageViewController: UIPageViewController, UIPageViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        let firstPage: LocationIntroViewController! = storyboard!.instantiateViewController()
        setViewControllers([firstPage],
            direction: UIPageViewControllerNavigationDirection.Forward,
            animated: false,
            completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



extension ConfigureLocationPageViewController: UIPageViewControllerDataSource {
    
    private var storyboardIds: [String] {
        return [
            LocationIntroViewController.storyboardIdentifier,
            LocationAuthorizationViewController.storyboardIdentifier
        ]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            let currentStoryboardId = viewController.dynamicType.storyboardIdentifier
            let currentIndex = storyboardIds.indexOf(currentStoryboardId)
            if(currentIndex == nil || currentIndex == 0) {return nil}
            let beforeStoryboardId = storyboardIds[currentIndex!-1]
            return storyboard!.instantiateViewControllerWithIdentifier(beforeStoryboardId)
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            let currentStoryboardId = viewController.dynamicType.storyboardIdentifier
            let currentIndex = storyboardIds.indexOf(currentStoryboardId)
            if(currentIndex == nil || currentIndex == storyboardIds.count-1) {return nil}
            let afterStoryboardId = storyboardIds[currentIndex!+1]
            return storyboard!.instantiateViewControllerWithIdentifier(afterStoryboardId)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return storyboardIds.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return storyboardIds.indices.first!
    }
    
}
