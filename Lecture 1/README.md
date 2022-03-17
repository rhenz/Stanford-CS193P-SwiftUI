# Lecture #1: Getting Started with SwiftUI

## Notes


This lecture mainly consists of Xcode Tour, brief introduction to Structs, how SwiftUI is a functional programming and a brief introdution also how to develop a SwiftUI View.

SwiftUI is a functional programming language that uses `View` protocol in order to create reusable UI Components. Views are rectangular areas on device screens that are used for drawing UIs.

Example of SwiftUI View:
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

- `ContentView` - This behaves like a view because it is a `View` type. It conforms to `View` protocol
- `body` - All struct views must define a `body` computed property. This is to provide the content for your view.
- `some View` - Second requirement of `View` protocol is that conforming types must indicate an `associated type` for the `body` property. But we don't need to declare this explicity. We declare the `body` property as an [opaque type](https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html), using the `some View` syntax. The exact type on the body's content which varies as you modify the body during development. Swift infers the exact type automatically.
- `Text` - A basic example of `View type` that displays one or more read-only texts.



For detailed documentation:
[Declaring a custom view](https://developer.apple.com/documentation/swiftui/declaring-a-custom-view)