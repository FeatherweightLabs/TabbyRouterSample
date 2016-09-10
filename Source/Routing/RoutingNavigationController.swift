import UIKit

final class RoutingNavigationController: UINavigationController {

    var didShowViewController: ((UIViewController) -> Void)? = nil

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        delegate = self
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }
}

extension RoutingNavigationController: UINavigationControllerDelegate {

    func navigationController(
        navigationController: UINavigationController,
        didShowViewController viewController: UIViewController, animated: Bool) {

        didShowViewController?(viewController)
    }
}
