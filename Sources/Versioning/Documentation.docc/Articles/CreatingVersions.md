# Creating Versions

Learn how to initialise semantic versions using integer values or string literals.

## Using Integers

You can construct a version using individual components:

```swift
let version = SemanticVersion(major: 2, minor: 1, patch: 4)
```

Minor and patch values are optional and default to `0`:

```swift
let version = SemanticVersion(major: 3)
```

## Using String Literals

You can also initialise versions using string literals:

```swift
let version: SemanticVersion = "1.2.3"
```

If fewer than three components are present, missing ones default to `0`:

```swift
let version: SemanticVersion = "2.1" // Interpreted as 2.1.0
```
