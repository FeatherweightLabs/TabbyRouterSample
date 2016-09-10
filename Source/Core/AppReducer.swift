import ReSwift

struct AppReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState()
        state.route = routeReducer(action, state: state.route)
        return state
    }
}

func routeReducer(action: Action, state: RouteEndpoint) -> RouteEndpoint {
    guard let action = action as? RouteSetAction else { return state }
    return action.endpoint
}
