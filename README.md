# Versioning

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fnashysolutions%2Fversioning%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/nashysolutions/versioning)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fnashysolutions%2Fversioning%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/nashysolutions/versioning)

**Versioning** is a lightweight, modern Swift library for working with [semantic versioning](https://semver.org/).  
It provides a simple and expressive API for defining, comparing, and validating version numbers.

---

## Features

- ✅ Intuitive `SemanticVersion` type
- ✍️ Initialisers for integers, strings, and string literals
- 🔐 Safe comparisons with automatic version normalisation
- 📦 Codable, Comparable, Hashable, Sendable
- 🧪 Fully testable and platform-agnostic

---

## 📦 Installation

Add this package via Swift Package Manager:

```swift
.product(name: "Versioning", package: "versioning")
```

## Usage

You can construct a version using individual components:

```swift
let version = SemanticVersion(major: 2, minor: 1, patch: 4)
```

Or string literals.

```swift
let a: SemanticVersion = "1"
let b: SemanticVersion = "1.0"
let c: SemanticVersion = "1.0.0"

// normalised
assert(a == b)
assert(b == c)
assert(a == c)
```
