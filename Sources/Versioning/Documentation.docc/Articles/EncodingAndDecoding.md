# Encoding and Decoding

`SemanticVersion` conforms to `Codable`, making it easy to use in JSON, Property Lists, and more.

## Encoding

You can encode a `SemanticVersion` instance using `JSONEncoder`:

```swift
let encoder = JSONEncoder()
let data = try encoder.encode(SemanticVersion(major: 1, minor: 2, patch: 3))
```

This produces a JSON string:

```json
"1.2.3"
```

## Decoding

You can decode a version string from JSON:

```swift
let decoder = JSONDecoder()
let jsonData = "1.2.3".data(using: .utf8)!
let version = try decoder.decode(SemanticVersion.self, from: jsonData)
```

This allows seamless integration with versioned configuration files, metadata, and APIs.
