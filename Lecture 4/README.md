# Lecture #4: Memorize Game Logic

## Notes

- enum
- optional
- Reactive UI
- @Published
- @ObservedObject
- @PropertyWrappers


### Enum

`enum` is another variety of data structure in addition to `class` and `struct`

Just like struct, `enum` is also a value type. It is copied as it is passed around


```swift
enum Direction {
    case north
    case east
    case west
    case south
}
```

Each state in `enum` can have its own _associated data_
```swift
enum FastFoodMenuItem {
    case hamburger(numberOfPatties: Int)
    case fries(size: FryOrderSize)
    case drink(String, ounces: Int)
    case cookie
}

enum FryOrderSize {
    case small
    case medium
    case large
}
```

### Optional

an `optional` is just an enum. Period, nothing more. 

```swift
enum Optional<T> {
    case none
    case some(T)
}
```


Where do we use Optional?
- Any time we have a value that can sometimes be not set or unspecified or undetermined.