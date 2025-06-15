# ``Versioning``

A focused Swift library for working with semantic version numbers using value types and expressive syntax.

## Overview

`Versioning` is a lightweight and modern Swift library for working with [semantic versioning](https://semver.org/). It provides a clean, type-safe API for creating, comparing, and inspecting semantic versions using Swift language features such as protocol conformance and string literals.

Use it to enforce version constraints, check for compatibility, or define structured versioning within your apps, libraries, or toolchains.

---

## Features

- 🌱 Value-semantic `SemanticVersion` type
- ✅ Comparison operators (`<`, `==`, etc.) out of the box
- ✍️ Initialises from integers or string literals
- 🔐 Conforms to:
  - `Codable`
  - `Sendable`
  - `Hashable`
  - `Comparable`
  - `CustomStringConvertible`
  - `ExpressibleByStringLiteral`
- 🧪 Fully testable with predictable behaviour

---

## Getting Started

### Creating Versions

```swift
let v1 = SemanticVersion(major: 1, minor: 0, patch: 0)
let v2: SemanticVersion = "1.2.3"
```
