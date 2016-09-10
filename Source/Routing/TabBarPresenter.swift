import UIKit
import FeatherweightRouter

func tabBarPresenter(initialTabRoutes: [RouteEndpoint]) -> (AppStore) -> UIPresenter {

    return { store in

        let tabBarController = RoutingTabBarController()
        var lastUsedRoutes = [String: RouteEndpoint]()
        var availableChildren = [UIViewController]()

        func routeForChild(child: UIViewController) -> RouteEndpoint? {
            if let route = lastUsedRoutes[String(child)] {
                return route
            }
            if let index = availableChildren.indexOf(child)
                where index < initialTabRoutes.count {
                return initialTabRoutes[index]
            }
            return nil
        }

        tabBarController.didSelectViewController = { child in
            guard let route = routeForChild(child) else { return }
            guard route != store.state.route else { return }
            store.dispatch(RouteSetAction(endpoint: route))
        }

        func currentRoute() -> RouteEndpoint {
            return store.state.route
        }

        func rememberLastUsedRouteFor(child: UIViewController, route: RouteEndpoint) {
            lastUsedRoutes[String(child)] = route
        }

        func setChild(child: UIViewController) {
            tabBarController.selectedViewController = child
            rememberLastUsedRouteFor(child, route: currentRoute())
        }

        func setChildren(children: [UIViewController]) {
            availableChildren = children
            tabBarController.setViewControllers(children, animated: true)
        }

        return Presenter(
            getPresentable: { tabBarController },
            setChild: setChild,
            setChildren: setChildren)
    }
}
