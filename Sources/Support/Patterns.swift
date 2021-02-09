public func ~=(pattern: Character, value: UInt8) -> Bool {
    pattern.asciiValue == .some(value)
}
