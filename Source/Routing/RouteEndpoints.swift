// From:
// http://alisoftware.github.io/swift/pattern-matching/2015/08/23/urls-and-pattern-matching/

import Foundation

enum RouteEndpoint {
    case onBoard
    case tab1
    case tab2
    case tab3
    case tab3a
    case tab3b
    case tab3c
}

extension RouteEndpoint: CustomStringConvertible {
    var description: String {
        switch self {
        case .onBoard: return "/"
        case .tab1:    return "/tab1"
        case .tab2:    return "/tab2"
        case .tab3:    return "/tab3"
        case .tab3a:   return "/tab3/a"
        case .tab3b:   return "/tab3/b"
        case .tab3c:   return "/tab3/c"
        }
    }
}

extension RouteEndpoint {

    init?(rawValue: [String]) {
        var g = rawValue.generate()
        switch (g.next(), g.next()) {

        case (nil, _):        self = .onBoard
        case ("tab1"?, nil):  self = .tab1
        case ("tab2"?, nil):  self = .tab2
        case ("tab3"?, nil):  self = .tab3
        case ("tab3a"?, nil): self = .tab3a
        case ("tab3b"?, nil): self = .tab3b
        case ("tab3c"?, nil): self = .tab3c
        default: return nil
        }
    }

    init?(rawValue: NSURL) {
        guard let components = NSURLComponents(URL: rawValue, resolvingAgainstBaseURL: false),
            let endpoint = RouteEndpoint(rawValue: components)
            else { return nil }
        self = endpoint
    }
    init?(rawValue: String) {
        guard let components = NSURLComponents(string: rawValue),
            let endpoint = RouteEndpoint(rawValue: components)
            else { return nil }
        self = endpoint
    }
    init?(rawValue: NSURLComponents) {
        guard let paths = rawValue.pathComponents,
            let endpoint = RouteEndpoint(rawValue: paths)
            else { return nil }
        self = endpoint
    }
}


extension RouteEndpoint: Equatable {}

func ==(lhs: RouteEndpoint, rhs: RouteEndpoint) -> Bool {
    return lhs.description == rhs.description
}
