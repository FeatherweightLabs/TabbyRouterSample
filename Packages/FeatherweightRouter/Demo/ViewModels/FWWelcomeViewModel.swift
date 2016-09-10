protocol ProvidesRouteDispatch {
    func dispatchRoute(_: String)
}

struct FWWelcomeViewModel: ProvidesColor {

    var backgroundColor = (192, 0, 192)

    let store: ProvidesRouteDispatch

    init(store: ProvidesRouteDispatch) {
        self.store = store
    }

    func navigateToLogin() {
        store.dispatchRoute("welcome/login")
    }

    func navigateToRegister() {
        store.dispatchRoute("welcome/register")
    }

    func navigateToStep2() {
        store.dispatchRoute("welcome/register/step2")
    }
}
