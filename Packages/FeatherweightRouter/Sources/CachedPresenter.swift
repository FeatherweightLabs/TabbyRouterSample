/**
 Creates a lazy wrapper around a presenteer creation function that wraps presenter scope, but does
 not get created until invoked.

 `(() -> Presentable) -> Presenter<Presentable>`

 - parameter createPresentable: callable that returns the presentable item

 - returns: Presenter<Presentable>
 */
func cachedPresenter<Presentable: AnyObject>(createPresentable: () -> Presentable)
    -> Presenter<Presentable> {

        weak var presentable: Presentable? = nil

        func maybeCachedPresentable() -> Presentable {
            if let cachedPresentable = presentable {
                return cachedPresentable
            }

            let newPresentable = createPresentable()
            presentable = newPresentable
            return newPresentable
        }

        return Presenter(getPresentable: maybeCachedPresentable)
}
