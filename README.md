# Versioning

A lightweight and modern Swift library for handling semantic versioning. `Versioning` makes it simple to define and compare semantic versions.

## Installation

### Swift Package Manager

To add `Versioning` to your project:

1. Open your project in Xcode.
2. Go to **File > Add Packages**.
3. Enter the repository URL: `https://github.com/nashysolutions/versioning`.
4. Choose the version or branch and integrate the package.

Alternatively, add the dependency directly to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/nashysolutions/versioning", from: "1.0.0")
]# versioning
```

# Usage

### SemanticVersion

```swift
let version1 = SemanticVersion(major: 1, minor: 0, patch: 0)
let version2: SemanticVersion = "1.2.3"

if version1 < version2 {
    print("\(version1) is older than \(version2)")
}
```
