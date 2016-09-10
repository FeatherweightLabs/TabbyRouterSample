import Foundation

func randomColor() -> (Int, Int, Int) {
    return (
        Int(arc4random_uniform(192) + 64),
        Int(arc4random_uniform(192) + 64),
        Int(arc4random_uniform(192) + 64))
}
