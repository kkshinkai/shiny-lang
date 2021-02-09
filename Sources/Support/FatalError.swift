@inline(__always)
public func unreachable(_ message: @autoclosure () -> String = String(),
                        file: StaticString = #file,
                        line: UInt = #line) -> Never {
    var isDebug = false
    assert({ isDebug = true; return true }())
    
    if isDebug {
        // TODO: "_isDebugAssertConfiguration()" should be used here. But before
        // that, we need to find a way to silence the "Will never be executed"
        // warning.
        fatalError(message(), file: file, line: line)
    }
    return unsafeBitCast((), to: Never.self)
}

@inline(__always)
public func unimplemented(_ message: @autoclosure () -> String = String(),
                          file: StaticString = #file,
                          line: UInt = #line) -> Never {
    fatalError(message(), file: file, line: line)
}

/// Since we don't have a diagnostic engine yet, I've built a temporary
/// replacement. It is almost an alias for `print(_:)` with no side effect.
/// By the way, do not capitalize the beginning of the diagnostic information.
@inline(__always)
public func informalDiagnose(_ message: @autoclosure () -> String) {
    print("Diagnosis: \(message())")
}
