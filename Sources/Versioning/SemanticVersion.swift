//
//  SemanticVersion.swift
//  common-resources
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

    /// Determines if two semantic versions are equal.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side `SemanticVersion`.
    ///   - rhs: The right-hand side `SemanticVersion`.
    /// - Returns: `true` if both versions have identical `major`, `minor`, and `patch` values.
    public static func == (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
    }

    /// Compares two semantic versions for order.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side `SemanticVersion`.
    ///   - rhs: The right-hand side `SemanticVersion`.
    /// - Returns: `true` if `lhs` is less than `rhs` when comparing `major`, `minor`, and `patch` in sequence.
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        if lhs.major != rhs.major {
            return lhs.major < rhs.major
        }
        if lhs.minor != rhs.minor {
            return lhs.minor < rhs.minor
        }
        return lhs.patch < rhs.patch
    }
}
