import UIKit
import FeatherweightRouter

func navigationPresenter(store: AppStore) -> UIPresenter {

    let blankView = UIViewController()
    blankView.view.backgroundColor = UIColor.darkGrayColor()

    let currentRoute = { return store.state.route }

    var routeHistory = [String: RouteEndpoint]()

    let navigationController = RoutingNavigationController(rootViewController: blankView)

    navigationController.didShowViewController = { viewController in
        guard let route = routeHistory["\(viewController)"] else { return }
        guard route != store.state.route else { return }
        store.dispatchAction(RouteSetAction(endpoint: route))
    }

    func setChildren(children: [UIViewController]) {
        let children = children.count == 0 ? [blankView] : children
        navigationController.setViewControllers(children, animated: true)
        if let viewController = children.last {
            routeHistory["\(viewController)"] = currentRoute()
        }
    }

    return Presenter(
        getPresentable: { navigationController },
        setChild: { _ in },
        setChildren: setChildren)
}
