import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T>() -> T! {
        let storyboardIdentifier = String(T)
        let optionalViewController = self.instantiateViewControllerWithIdentifier(storyboardIdentifier)
        return optionalViewController as! T
    }
}
