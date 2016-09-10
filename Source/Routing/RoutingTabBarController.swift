import UIKit

class RoutingTabBarController: UITabBarController, UITabBarControllerDelegate {

    var didSelectViewController: (UIViewController -> Void)? = nil

    override func viewDidLoad() {
        delegate = self
    }

    func tabBarController(tabBarController: UITabBarController,
                          didSelectViewController viewController: UIViewController) {
        didSelectViewController?(viewController)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
