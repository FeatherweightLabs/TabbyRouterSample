/**

 To control the display or change of route, each router needs a presenter to hand off to. The
 presenter separates the route tree from interface code.

 The actual presenter is owned by the presenter which can control the lifecycle of ViewControllers.

 */
public struct Presenter<ViewController> {

    /// Returns the child presenter
    public var getPresentable: () -> ViewController

    /// Sets the child value to the passed in presenter
    public var setChild: ViewController -> Void = { _ in
        fatalError("Call to unset setChild") }

    /// Sets the children value to passed in presenters
    public var setChildren: [ViewController] -> Void = { _ in
        fatalError("Call to unset setChildren") }

    /// The owned presenter
    public var presentable: ViewController { return getPresentable() }

    /**
     Shorthand for the setChild function

     - parameter child: child presenter
     */
    public func set(child: ViewController) {
        setChild(child)
    }

    /**
     Shorthand for the setChildren function

     - parameter children: presenter children
     */
    public func set(children: [ViewController]) {
        setChildren(children)
    }

    /**
     Presenter initialiser

     - parameter getPresentable: Returns the owned presenter
     - parameter setChild:       Callback action to set the child presenter
     - parameter setChildren:    Callback to set the children presenters
     */
    public init(getPresentable: Void -> ViewController, setChild: (ViewController -> Void)? = nil,
        setChildren: ([ViewController] -> Void)? = nil) {
            self.getPresentable = getPresentable
            if let setChild = setChild {
                self.setChild = setChild
            }
            if let setChildren = setChildren {
                self.setChildren = setChildren
            }
    }
}
