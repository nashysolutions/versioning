# Comparing Versions

Semantic versions can be compared using standard comparison operators.

## Ordering

`SemanticVersion` conforms to `Comparable`, so you can use `<`, `<=`, `>`, and `>=`:

```swift
let a: SemanticVersion = "1.0.0"
let b: SemanticVersion = "1.2.0"

if a < b {
    print("\(a) is older than \(b)")
}
```

Trailing `.0` components are ignored when comparing:

```swift
"1.0.0" == "1"
```

## Equality

Versions are equal if their normalised components match:

```swift
let a: SemanticVersion = "2.0"
let b: SemanticVersion = "2.0.0"

assert(a == b)
```
