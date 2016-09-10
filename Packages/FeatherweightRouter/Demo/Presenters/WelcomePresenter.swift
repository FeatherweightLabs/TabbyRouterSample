import UIKit
import FeatherweightRouter

func welcomePresenter(store: AppStore) -> UIPresenter {

    let viewController = FWWelcomeViewController(FWWelcomeViewModel(store: store))

    return Presenter(getPresentable: { viewController })
}
