import Foundation
import Support

/// Compiler instance for compiling a compilation unit.
public class CompilerInstance {
    // TODO: In Swift, the compilation unit is module, but I don't want to
    // support multiple files yet, so in Shiny, the compilation unit is single
    // file. But anyway, for the sake of possible evolution in the future,
    // I distinguish between "ASTContext" and "CompilerInstance" here.
    
    let sourceCodeFilePath: String
    let sourceCodeBuffer: Data
    
    public init(forSource filePath: String) /* throws */ {
        sourceCodeFilePath = NSString(string: filePath).expandingTildeInPath
        let url = URL(fileURLWithPath: sourceCodeFilePath)
        
        #warning("Did not check if the file exists")
        sourceCodeBuffer = try! Data(contentsOf: url, options: .mappedIfSafe)
    }
    
    public func performParseOnly() {}
    
    public func performCompile() {
        unimplemented("performCompile")
    }
}
