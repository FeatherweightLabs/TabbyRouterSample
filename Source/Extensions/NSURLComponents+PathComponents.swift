import Foundation

extension NSURLComponents {
    var pathComponents: [String]? {
        return (path as NSString?)?.pathComponents.filter { $0 != "/" }
    }
}
