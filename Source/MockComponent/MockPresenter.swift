import FeatherweightRouter

func randomPresenter(title: String, buttonText: String, buttonRoute: RouteEndpoint) -> (store: AppStore) -> UIPresenter {
    return { store in
        mockPresenter(
            store,
            backgroundColor: randomColor(),
            title: title,
            callToActionTitle: buttonText,
            callToActionRoute: buttonRoute)
    }
}

func mockPresenter(store: AppStore,
    backgroundColor: (Int, Int, Int),
    title: String,
    callToActionTitle: String,
    callToActionRoute: RouteEndpoint) -> UIPresenter {

        let viewController = MockViewController(MockViewModel(
            store: store,
            backgroundColor: backgroundColor,
            title: title,
            callToActionTitle: callToActionTitle,
            callToActionRoute: callToActionRoute))

        return Presenter(getPresentable: { viewController })
}
