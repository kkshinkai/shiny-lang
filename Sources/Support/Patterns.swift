public func ~=(pattern: Character, value: UInt8) -> Bool {
    if let asciiValue = pattern.asciiValue {
        return asciiValue == value
    } else {
        return false
    }
}
