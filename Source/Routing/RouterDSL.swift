import FeatherweightRouter

// MARK: - DSL functions

// MARK: - (UIStoreRouter, [UIStoreRouter]) -> UIStoreRouter

func junctionRouter(presenter: UIStorePresenter, children: [UIStoreRouter]) -> UIStoreRouter {
    return { state in
        Router(presenter(state)).junction(children.map(into(state)))
    }
}

func stackRouter(presenter: UIStorePresenter, children: [UIStoreRouter]) -> UIStoreRouter {
    return { state in
        Router(presenter(state)).stack(children.map(into(state)))
    }
}

// MARK: - ([UIStoreRouter]) -> UIStoreRouter

func toggleRouter(children: [UIStoreRouter]) -> UIStoreRouter {
    return junctionRouter(togglePresenter, children: children)
}

func tabBarRouter(initialRoutes: [RouteEndpoint] = [], children: [UIStoreRouter]) -> UIStoreRouter {
    return junctionRouter(tabBarPresenter(initialRoutes), children: children)
}

func navigationRouter(tabItem tabItem: TabItem, children: [UIStoreRouter]) -> UIStoreRouter {
    return stackRouter({ navigationPresenter(tabItem: tabItem, store: $0) }, children: children)
}

// MARK: - (RouteEndpoint, UIStorePresenter, [UIStoreRouter]) -> UIStoreRouter

func route(
    endpoint endpoint: RouteEndpoint,
    presenter: (UIStorePresenter),
    children: [UIStoreRouter]? = nil) -> UIStoreRouter {

    return { state in
        let concreteChildren = children.map { $0.map(into(state)) } ?? []
        return Router(presenter(state)).route(
            predicate: { $0 == endpoint },
            children: concreteChildren)
    }
}

// MARK: - (AppStore) -> (UIStoreRouter) -> UIRouter

func into(store: AppStore) -> UIStoreRouter -> UIRouter {
    return { $0(store) }
}
