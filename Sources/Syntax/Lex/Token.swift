import Foundation

public struct Token {
    let kind: Kind
    let content: Data

    func `is`(_ kinds: Kind...) -> Bool {
        kinds.contains(kind)
    }
    
    func isNot(_ kinds: Kind...) -> Bool {
        !kinds.contains(kind)
    }
}
