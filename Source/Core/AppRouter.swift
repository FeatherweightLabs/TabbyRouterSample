import UIKit
import FeatherweightRouter


func appRouter() -> UIStoreRouter {
    let onBoard = randomPresenter("On Boarding", buttonText: "=> Tab 1", buttonRoute: .tab1)
    let tab1 = randomPresenter("Tab 1", buttonText: "=> Tab 2", buttonRoute: .tab2)
    let tab2 = randomPresenter("Tab 2 (Nav)", buttonText: "=> Tab 3", buttonRoute: .tab3)
    let tab3 = randomPresenter("Tab 3 (Nav)", buttonText: "=> Tab 3-a", buttonRoute: .tab3a)
    let tab3a = randomPresenter("Tab 3-a", buttonText: "=> Tab 3-b", buttonRoute: .tab3b)
    let tab3b = randomPresenter("Tab 3-b", buttonText: "=> Tab 3-c", buttonRoute: .tab3c)
    let tab3c = randomPresenter("Tab 3-c", buttonText: "=> On Boarding", buttonRoute: .onBoard)

    return toggleRouter([

        route(endpoint: .onBoard, presenter: onBoard),

        tabBarRouter([.tab1, .tab2, .tab3], children: [

            route(endpoint: .tab1, presenter: tab1),

            navigationRouter(
                tabItem: TabItem(title: "TAB 2", image: UIImage(named: "tab-icon-placeholder")),
                children:[
                    route(endpoint: .tab2, presenter: tab2),
                ]),

            navigationRouter(
                tabItem: TabItem(title: "TAB 3", image: UIImage(named: "tab-icon-placeholder")),
                children:[
                    route(endpoint: .tab3, presenter: tab3, children: [
                        route(endpoint: .tab3a, presenter: tab3a),
                        route(endpoint: .tab3b, presenter: tab3b),
                        route(endpoint: .tab3c, presenter: tab3c),
                        ]),
                ]),
            ]),
        ])
}
