# Shiny Programming Language

A tiny self-hosted Swift compiler, for learning the Swift language and the Swift
compiler. This is an experimental project, do not try to use it in a production
environment.

## Plans

Here are some short-term goals.

-   [ ] Completes AST, Lexer and Parser, but does not provide diagnostic
    information and diagnostic engine. Shiny will allow undefined behavior when
    there are lexical or syntactic errors in the source code.

Here are some general goals (I should probably call them manifestos). Maybe
someday I'll start working on them, but not now.

-   [ ] AST and constraint system need better allocators, we should use arena or
    memory pools
