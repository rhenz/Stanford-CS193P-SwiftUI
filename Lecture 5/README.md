# Lecture #5: Properties Layout @ViewBuilder

# Notes


## Property Observers
_Property Observers_ observe and respond to the changes in a property's value. Property Observers are called every time a property's value change, even if the new value is the same as the current value.

In our _Memorize_ project. We use a property observer to refactor our game's logic to make it much shorter and not prone to errors/bugs:

```swift
private var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get { return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
    set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
}
```

We make use of functional programming with the help of the Higher-Order Functions like `filter(_:)` and `forEach(_:)` to make our codes much shorter. The most important aspects of functional programming is _immutable state_ and _lack of side effects_.


## Computed Properties
A computed property provides a getter and an optional setter to indirectly access other properties and values.

Example:

```swift
extension Array {
    var oneAndOnly: Element? {
        return self.count == 1 ? self.first : nil
    }
}
```

## @State
A property wrapper type that can read and write a value managed by SwiftUI. SwiftUI uses the `@State` property wrapper to allow us to modify values inside a struct coz normally it is not allowed because structs are value types.

When we use `@State` before a property, SwiftUI will move its storage out from our struct into shared storage managed by SwiftUI. This means SwiftUI can destroy or recreate our struct whenever needed, without losing the state it was storing.

We should use `@State` with basic data types like `Int` and `String`. And this shouldn't be shared with other views.

```swift
@State private var isPresenting = false
```

Apple also recommends that you mark these properties as `private` as a good practice.


## @ViewBuilder
ViewBuilder is used extensively in SwiftUI to let you create new on-screen views by just listing them out in a trailing closure. It's a property wrapper applied to function parameter. Usually, it's just working behind the scenes, so you don't have to worry about it. But, you can also define your own functions that are view builders, and also include them in your own custom views.

## GeometryReader
Is a type that reads the geometry of its container to produce a view.

```swift
var body: some View {
    GeometryReader { geometry in
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                Text(card.content).font(font(in: geometry.size))
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

private func font(in size: CGSize) -> Font {
    Font.system(size: min(size.width, size.width) * DrawingConstants.fontScale)
}
```

