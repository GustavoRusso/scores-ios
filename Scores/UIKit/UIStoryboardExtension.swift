import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T>() -> T! {
        let storyboardIdentifier = String(T.self)
        let optionalViewController = self.instantiateViewController(withIdentifier: storyboardIdentifier)
        return optionalViewController as! T
    }
}
