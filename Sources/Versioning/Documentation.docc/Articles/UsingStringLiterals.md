# Using String Literals

`SemanticVersion` supports initialisation from string literals for convenience and readability.

## Basic Usage

You can create a `SemanticVersion` directly from a string literal:

```swift
let version: SemanticVersion = "1.2.3"
```

This makes the version type ergonomic and expressive, especially in configuration contexts.

## Partial Versions

If the string contains fewer than three components, missing values default to `0`:

```swift
let version1: SemanticVersion = "2"      // Interpreted as 2.0.0
let version2: SemanticVersion = "2.1"    // Interpreted as 2.1.0
```

## Invalid Input

If the string contains non-numeric values, they are treated as `0`:

```swift
let version: SemanticVersion = "1.two.3" // Interpreted as 1.0.3
```

To avoid ambiguity, prefer validated initialisation for untrusted input.

```swift
let version: SemanticVersion = "1.two.3" 
print(version) // Prints "1.0.3"
```
