extension Token {
    public enum Kind {
        /// Keywords that start declarations.
        case `associatedtype`,
             `class`,
             `deinit`,
             `enum`,
             `extension`,
             `func`,
             `import`,
             `init`,
             `inout`,
             `let`,
             `operator`,
             `precedencegroup`,
             `protocol`,
             `struct`,
             `subscript`,
             `typealias`,
             `var`
        /// Keywords for access control, also declaration keywords.
        case `fileprivate`,
             `internal`,
             `private`,
             `public`,
             `static`
        // TODO: I'm not quite sure why "open" doesn't appear here in the Swift
        // source code. Maybe it is a contextual keyword, I'll find out later.
        // Also, I don't know why "static" was put in this category.
        
        /// Statement keywords.
        case `defer`,
             `if`,
             `guard`,
             `do`,
             `repeat`,
             `else`,
             `for`,
             `in`,
             `while`,
             `return`,
             `break`,
             `continue`,
             `fallthrough`,
             `switch`,
             `case`,
             `default`,
             `where`,
             `catch`,
             `throw`
        
        /// Expression ketwords
        case `as`,
             `any`,
             `false`,
             `is`,
             `nil`,
             `rethrows`,
             `super`,
             `self`,
             `capitalSelf`,
             `true`,
             `try`,
             `throws`
        // Actually, "capitalSelf" is not a keyword in Swift, it's a valid
        // identifier. I quoted it in backtick (aka. grave accent "`") just for
        // better coordination.
        
        case `__FILE__`,
             `__LINE__`,
             `__COLUMN__`,
             `__FUNCTION__`,
             `__DSO_HANDLE__`
        
        // "__DSO_HANDLE__" provides an UnsafePointer to the current dynamic
        // shared object (.dylib or .so file). I'm not going to implement this
        // feature, it will be reported as an error in lexer.
        //
        // SeeAlso: SE-0028 https://github.com/apple/swift-evolution/blob/master/proposals/0028-modernizing-debug-identifiers.md
        
        /// Pattern keywords
        case wildcard // aka. "_"
        
        /// Punctuators
        case leftParenthesis,        // (
             rightParenthesis,       // )
             leftCurlyBracket,       // {
             rightCurlyBracket,      // }
             leftSquareBracket,      // [
             rightSquareBracket,     // ]
             lessThenSign,           // <
             greaterThenSign,        // >
             fullStop,               // .
             prefixFullStop,         // .
             comma,                  // ,
             ellipsis,               // ...
             colon,                  // :
             semicolon,              // ;
             equalsSign,             // =
             commercialAt,           // @
             numberSign,             // #
             ampersand,              // &
             perfixAmpersand,        // &
             righwardsArrow,         // ->
             graveAccent,            // `
             reverseSolidus,         // \
             postfixExclamationMark, // !
             postfixQuestionMark,    // ?
             infixQuestionMark,      // ?
             quotationMark,          // "
             apostrophe,             // '
             tripleQuotationMark     // """
        
        /// Keywords prefixed with a `#`.
        case poundKeyPath,
             poundLine,
             poundSelector,
             poundFile,
             poundFileID,
             poundFilePath,
             poundColumn,
             poundFunction,
             poundDSOHandle,
             poundAssert,
             poundSourceLocation,
             poundWarning,
             poundError,
             poundIf,
             poundElse,
             poundElseif,
             poundEndif,
             poundAvailable,
             poundFileLiteral,  // ExpressibleByFileReferenceLiteral
             poundImageLiteral, // ExpressibleByImageLiteral
             poundColorLiteral  // ExpressibleByColorLiteral
        
        /// Literals
        case integerLiteral,
             floatingPointLiteral,
             stringLiteral
             
        /// Miscellaneous
        case unknown,
             identifier,
             unspacedBinaryOperator,
             postfixOperator,
             prefixOperator,
             dollarIdentifier,
             contextualKeywords,
             rawStringDelimiter,
             stringSegment,
             stringInterpolationAnchor,
             yield // This should be something in Swift6, we don't need it yet
        // TODO: A contextual keyword is used to provide a specific meaning in
        // the code, but it is not a reserved word in Swift. I need a list of
        // them.
    }
}
