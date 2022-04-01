# Lecture #3: MVVM and the Swift type systems

## Notes



### MVVM
`Model`
    - UI Independent
    - Data & Logic
    - "the truth"

`View`
    - reflects the model
    - stateless
    - declared(declarative)
    - reactive

`ViewModel`
    - Binds the `view` to `model`
    - Interpreter
    - Gatekeeper



### Struct and Class differences

_Structs_ and _Classes_ have:
- pretty much exactly same syntax
- stored vars
- computed vars
- constant lets😂
- functions
- initializers

_Structs_ and _Classes_ differences:
- value type ; reference type
- copy on write ; automatically reference counted
- functional programming ; object-oriented programming
- no inheritance ; inheritance


### Generics

I love how the lecturer described _Generics_ in very short sentence. _Generics_ are "don't care types" 
