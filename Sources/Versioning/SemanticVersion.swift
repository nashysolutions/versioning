//
//  SemanticVersion.swift
//  versioning
//
//  Created by Robert Nash on 26/12/2024.
//

import Foundation

/// Represents a semantic version, following the format `major.minor.patch`.
///
/// The struct supports version comparison, string representation, and initialization from literals,
/// making it versatile for versioning in software systems. Conforms to several protocols
/// such as `Codable`, `Sendable`, `Hashable`, `Comparable`, and `CustomStringConvertible`
/// for broad usability in various contexts.
public struct SemanticVersion: Codable, Sendable, Hashable, Comparable, CustomStringConvertible, ExpressibleByStringLiteral {

    /// The major version number, indicating significant changes or compatibility breaks.
    public let major: Int

    /// The minor version number, typically for backward-compatible feature additions.
    public let minor: Int

    /// The patch version number, generally for backward-compatible bug fixes.
    public let patch: Int

    /// Initializes a semantic version with major, minor, and patch components.
    ///
    /// - Parameters:
    ///   - major: The major version number (required).
    ///   - minor: The minor version number (optional, defaults to `0` if not provided).
    ///   - patch: The patch version number (optional, defaults to `0` if not provided).
    public init(major: Int, minor: Int? = nil, patch: Int? = nil) {
        self.major = major
        self.minor = minor ?? 0
        self.patch = patch ?? 0
    }

    /// Initializes a semantic version from a string literal.
    ///
    /// - Parameter value: A string in the format `major.minor.patch`. Missing components default to `0`.
    ///
    /// Example:
    /// ```swift
    /// let version: SemanticVersion = "1.2.3"
    /// ```
    public init(stringLiteral value: StringLiteralType) {
        let components = value.split(separator: ".").map { Int($0) ?? 0 }
        self.major = components.count > 0 ? components[0] : 0
        self.minor = components.count > 1 ? components[1] : 0
        self.patch = components.count > 2 ? components[2] : 0
    }
    
    public init?(_ string: String) {
        let parts = string.split(separator: ".")
        guard parts.count <= 3,
              let major = parts.indices.contains(0) ? Int(parts[0]) : 0,
              let minor = parts.indices.contains(1) ? Int(parts[1]) : 0,
              let patch = parts.indices.contains(2) ? Int(parts[2]) : 0
        else {
            return nil
        }
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    /// A textual representation of the semantic version.
    ///
    /// Example:
    /// ```swift
    /// let version = SemanticVersion(major: 1, minor: 2, patch: 3)
    /// print(version) // Output: "1.2.3"
    /// ```
    public var description: String {
        "\(major).\(minor).\(patch)"
    }

    /// Compares two semantic versions for order.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side `SemanticVersion`.
    ///   - rhs: The right-hand side `SemanticVersion`.
    /// - Returns: `true` if `lhs` is less than `rhs` when comparing `major`, `minor`, and `patch` in sequence.
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        let lhsComponents = lhs.normalized
        let rhsComponents = rhs.normalized
        let count = max(lhsComponents.count, rhsComponents.count)
        for i in 0..<count {
            let left = i < lhsComponents.count ? lhsComponents[i] : 0
            let right = i < rhsComponents.count ? rhsComponents[i] : 0
            if left != right {
                return left < right
            }
        }
        return false
    }
}

public extension SemanticVersion {
    
    /// Determines if two semantic versions are equal.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side `SemanticVersion`.
    ///   - rhs: The right-hand side `SemanticVersion`.
    /// - Returns: `true` if both versions have identical `major`, `minor`, and `patch` values.
    static func == (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        lhs.normalized == rhs.normalized
    }
    
    private var normalized: [Int] {
        var components = [major, minor, patch]
        while components.last == 0 {
            components.removeLast()
        }
        return components
    }
}
