import UIKit

class ToggleViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName: String?, bundle: NSBundle?) {
        super.init(nibName: nibName, bundle: bundle)
        view.frame = UIScreen.mainScreen().bounds
    }

    func removeCurrentChild() {
        for child in childViewControllers {
            child.willMoveToParentViewController(nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
    }

    func setChild(child: UIViewController) {
        guard child != childViewControllers.first else { return }

        let oldChildren = childViewControllers
        let animated = oldChildren.count > 0

        child.view.frame = view.frame
        addChildViewController(child)
        view.insertSubview(child.view, atIndex: 0)
        child.didMoveToParentViewController(self)

        if animated {

            UIView.animateWithDuration(
                0.3,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseInOut,
                animations: {
                    for child in oldChildren {
                        child.view.alpha = 0
                    }
                    self.setNeedsStatusBarAppearanceUpdate()
                }, completion: { completed in
                    for child in oldChildren {
                        child.willMoveToParentViewController(nil)
                        child.view.removeFromSuperview()
                        child.removeFromParentViewController()
                        child.view.alpha = 1
                    }
            })
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return childViewControllers.last?.preferredStatusBarStyle()
            ?? super.preferredStatusBarStyle()
    }
}
