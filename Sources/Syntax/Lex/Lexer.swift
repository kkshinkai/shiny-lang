import Foundation
import Support

public final class Lexer {
    typealias CodeUnit = UInt8
    
    let source: Data
    
    // Here I am trying to build some basic facilities for the source file
    // buffer (aka. "source"). When you only use "currentIndex" and
    // "getCodeUnit(at:)" to access the buffer, it will never cause
    // an out-of-bounds error. Note, do not touch the "currentIndexValue".
    private var currentIndexValue: Data.Index
    private var currentIndex: Data.Index {
        get { currentIndexValue }
        set {
            if newValue < 0 {
                currentIndexValue = 0
            } else if 0 <= newValue, newValue < source.endIndex {
                currentIndexValue = newValue
            } else {
                currentIndexValue = source.endIndex
            }
        }
    }
    private func getCodeUnit(at index: Data.Index) -> CodeUnit {
        assert(index >= source.startIndex, "Current index out of range")
        
        // Here we have assumed that eof is 0, but this may not be the most
        // reasonable value. Anyway, let's be consistent with the Swift
        // compiler.
        return index < source.endIndex ? source[index] : 0x00
    }
    
    
    private var currentCodeUnit: CodeUnit {
        getCodeUnit(at: currentIndex)
    }
    private var eatCurrentCodeUnit: CodeUnit {
        defer { currentIndex += 1 }
        return currentCodeUnit
    }
    private func getCodeUnitOrEof(at index: Data.Index) -> CodeUnit {
        assert(index >= source.startIndex, "Current index out of range")
        
        // Here we have assumed that eof is 0, but this may not be the most
        // reasonable value. Anyway, let's be consistent with the Swift
        // compiler.
        return index < source.endIndex ? source[index] : 0x00
    }
    
    private var contentStratIndex: Data.Index
    private var isNextTokenAtStartOfLine = true
    
    public init(of source: Data) {
        self.source = source
        self.currentIndex = source.startIndex
        
        // Check for Unicode BOM at the start of file.
        let bomLength = source.starts(with: [0xEF, 0xBB, 0xBF]) ? 3 : 0
        self.contentStratIndex = source.startIndex + bomLength
    }
    
    public func lex() -> Token {
        assert(source.indices.contains(currentIndex),
               "Current index out of range")
        
        if currentIndex == source.startIndex {
            if contentStratIndex > source.startIndex {
                let bomLength = contentStratIndex - source.startIndex
                assert(bomLength == 3, "UTF-8 BOM must be 3 bytes")
                currentIndex += bomLength
            }
            isNextTokenAtStartOfLine = true
        } else {
            isNextTokenAtStartOfLine = false
        }
        
        lexTrivia()
        
        let tokenStartIndex = currentIndex
        
        switch eatCurrentCodeUnit {
        case "\n", "\r":
            unreachable("Newlines should be eaten by lexTrivia")
        case " ", "\t", 0x0C/*="\f"*/, 0x0B/*="\v"*/:
            unreachable("Whitespaces should be eaten by lexTrivia")
        case 0xFF, 0xFE:
            informalDiagnose("input files must be encoded as UTF-8 instead of UTF-16")
        case "\0":
            return Token(kind: .eof, content: source[tokenStartIndex..<currentIndex])
            
        }
        
    }
    
    func lexTrivia() {
        // TODO: I'm not ready to handle trivia in detail yet, here is just a
        // rough implementation.
    }
    
    
    /// Null character meaning kind.
    ///
    /// When a null character appears in a file, it may have different meanings,
    /// and we need to distinguish between these cases in order to lex them.
    enum NullCharacterKind {
        /// String buffer terminator.
        case bufferEnd
        /// Embedded nul character.
        case embedded
        /// Code completion marker.
        case codeCompletion
    }
    
    func getNullCharacterKind(at index: Data.Index) -> NullCharacterKind {
    }
}

