import ReSwift
import ReactiveKit

class ObservableStore<State: StateType>: Store<State> {

    let observable: Property<State>
    var isDispatching = false
    var reducer: AnyReducer!

    override var state: State! {
        didSet {
            observable.value = state
        }
    }

    required init(reducer: AnyReducer, state: State, middleware: [Middleware]) {
        observable = Property(state)
        super.init(reducer: reducer, state: state, middleware: middleware)
        self.reducer = reducer
    }

    func map<U: Equatable>(selector: State -> U) -> Stream<U> {
        return observable.map(selector)
    }

    func dispatchAction(action: Action) {
        dispatch(action)
    }

    func distinctMap<U: Equatable>(to selector: State -> U) -> Stream<U> {
        return map(selector).distinct()
    }

    func observeChanges<U: Equatable>(to selector: State -> U, observer: U -> ())
        -> Disposable {
            return distinctMap(to: selector).observeNext(observer)
    }
}
