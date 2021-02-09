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
