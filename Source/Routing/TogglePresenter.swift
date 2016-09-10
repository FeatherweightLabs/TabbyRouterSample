import UIKit
import FeatherweightRouter

func togglePresenter(store: AppStore) -> UIPresenter {

    let viewController = ToggleViewController()

    return Presenter(
        getPresentable: { viewController },
        setChild: viewController.setChild,
        setChildren: { _ in})
}
