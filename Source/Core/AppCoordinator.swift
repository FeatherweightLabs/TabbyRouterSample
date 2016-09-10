import UIKit
import ReSwift
import ReactiveKit
import FeatherweightRouter

class AppCoordinator {

    var store: AppStore
    let router: UIRouter
    var viewController: UIViewController { return router.presentable }

    let bag = DisposeBag()

    init(state: AppState, router storeRouter: UIStoreRouter) {

        store = ObservableStore(reducer: AppReducer(), state: state, middleware: [])
        router = storeRouter(store)
        subscribeRouterToUpdates()
    }

    func subscribeRouterToUpdates() {
        store.observeChanges(to: { $0.route }) { [unowned self] route in
            print("Route did change to: '\(route)")
            self.router.setRoute(route)
            }.disposeIn(bag)
    }

    deinit {
        bag.dispose()
    }
}
