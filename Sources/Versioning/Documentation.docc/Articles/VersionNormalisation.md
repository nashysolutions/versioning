# Version Normalisation

`SemanticVersion` uses a normalisation strategy to ensure comparisons and equality checks are intuitive.

## Purpose

Trailing `.0` components are considered insignificant for comparison purposes. This allows versions like `1`, `1.0`, and `1.0.0` to be treated as equal.

## Examples

```swift
let a: SemanticVersion = "1"
let b: SemanticVersion = "1.0"
let c: SemanticVersion = "1.0.0"

assert(a == b)
assert(b == c)
assert(a == c)
```

## Implementation Detail

Internally, the version is represented as an array of components:

```swift
[major, minor, patch]
```

Trailing `0`s are removed before comparison. This normalisation only affects comparison logic — the original values are preserved for encoding and display.

## Recommendation

To ensure clear communication, always display full versions (`1.0.0`) in user interfaces and logs, even if comparison logic treats them equivalently.
