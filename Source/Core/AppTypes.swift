import ReSwift
import UIKit
import ReactiveKit
import FeatherweightRouter

typealias AppStore = ObservableStore<AppState>
typealias ObservableState = Property<AppState>
typealias ActionDispatch = Action -> ()

typealias UIRouter = Router<UIViewController, RouteEndpoint>
typealias UIPresenter = Presenter<UIViewController>
typealias UIStoreRouter = AppStore -> UIRouter
typealias UIStorePresenter = AppStore -> UIPresenter

protocol DispatchDelegate {
    func dispatch(action: Action) -> Any
}
