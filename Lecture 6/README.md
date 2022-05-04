# Lecture #6: Protocols Shapes

# Notes

## Protocol
Is sort of a "stripped-down" struct/class. It has functions and vars, but no implementation(or storage). Declaring a protocol looks very similar to struct or class(just w/o the implementation).

```swift
protocol Moveable {
	func move(by: Int)
	var hasMoved: Bool { get }
	var distanceFromStart: Int { get set }
}
```

Then any type can implement this `Moveable` protocol

```swift
struct PortableThing: Moveable {
	// must implement `move(by:)`, `hasMoved` and `distanceFromStart`
}
```

`PortableThing` now conforms to `Moveable`. We can also think of it as "_behaves like a_"

There's also a thing called _protocol inheritance_:

```swift
protocol Vehicle: Moveable {
	var passengerCount: Int { get set }
}

class Car: Vehicle {
	// must implement all properties and function of `Moveable` and `Vehicle`
}
```

And we can make a class/struct also conform to multiple protocols. It's perfectly legal

```swift
class Car: Vehicle, Impoundable, Leasable {
	// must implement all funcs/vars of these protocols
}
```

## What is a protocol used for?

* Very rarely, a protocol can be used as a type(in any other circumstances a type can be used). Not all protocols can be used this way (View can't, nor Equatable, nor Identifiable)

```swift
func travelAround(using moveable: Moveable)
let foo = [Moveable]()
```

* A much more common usage is to specify the behavior of a struct, class or enum

```swift
struct EmojiMemoryGameView: View
```
Just by doing this, EmojiMemoryGameView became a very powerful struct and of course we have to implement the `var body` which is a required property of `View` 


```
class EmojiMemoryGame: ObservableObject
```


* There are a bunch of very often used, lightweight behaviors as well like:
`Identifiable`, `Hashable`, `Equatable`, `CustomStringConvertible`


* Another use is turning _don't cares_ aka as `Generics` into _somewhat cares_.

```swift
struct MemoryGame<CardContent> where CardContent: Equatable
```

* We can also use protocols to restrict an `extension` to work only with certain things

```swift
extension Array where Element: Hashable { ... }
```

Whatever funcs we add on this extension will only be available for certain Arrays. Namely those whose elements conform to `Hashable`. For all other arrays, it will be as if this extension does not even exist.