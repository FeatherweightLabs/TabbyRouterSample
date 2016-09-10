import UIKit
import ReSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator!

    func application(application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        coordinator = AppCoordinator(state: AppState(), router: appRouter())
        window?.rootViewController = coordinator.viewController
        window?.makeKeyAndVisible()

        UIWindow.appearance().backgroundColor = UIColor.blackColor()
        UIWindow.appearance().tintColor = UIColor.whiteColor()

        UINavigationBar.appearance().barStyle = .Black
        UITabBar.appearance().barStyle = .Black

        return true
    }
}
