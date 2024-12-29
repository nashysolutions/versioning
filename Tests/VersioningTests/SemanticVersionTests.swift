//
//  SemanticVersionTests.swift
//  versioning
//
//  Created by Robert Nash on 29/12/2024.
//

import Foundation
import Testing

@testable import Versioning

@Suite("SemanticVersion Tests")
struct SemanticVersionTests {
    
    @Test("Initialise SemanticVersion with major, minor, and patch values")
    func testInitialisation() {
        /// Given
        ///
        /// A set of explicit major, minor, and patch values.
        let major = 1
        let minor = 2
        let patch = 3
        
        /// When
        ///
        /// Initialising a SemanticVersion.
        let version = SemanticVersion(major: major, minor: minor, patch: patch)
        
        /// Then
        ///
        /// The properties should match the input values.
        #expect(version.major == major)
        #expect(version.minor == minor)
        #expect(version.patch == patch)
    }
    
    @Test("Initialise SemanticVersion with default minor and patch values")
    func testDefaultInitialisation() {
        /// Given
        ///
        /// A major version, without providing minor and patch values.
        let major = 1
        
        /// When
        ///
        /// Initialising a SemanticVersion.
        let version = SemanticVersion(major: major)
        
        /// Then
        ///
        /// Minor and patch should default to 0.
        #expect(version.major == major)
        #expect(version.minor == 0)
        #expect(version.patch == 0)
    }
    
    @Test("Initialise SemanticVersion with a string literal")
    func testStringLiteralInitialisation() {
        /// Given
        ///
        /// A semantic version string.
        let versionString = "1.2.3"
        
        /// When
        ///
        /// Initialising a SemanticVersion using a string literal.
        let version = SemanticVersion(stringLiteral: versionString)
        
        /// Then
        ///
        /// The properties should match the parsed values from the string.
        #expect(version.major == 1)
        #expect(version.minor == 2)
        #expect(version.patch == 3)
    }
    
    @Test("SemanticVersion description should be formatted correctly")
    func testDescription() {
        /// Given
        ///
        /// A SemanticVersion instance.
        let version = SemanticVersion(major: 1, minor: 2, patch: 3)
        
        /// When
        ///
        /// Converting the version to a string.
        let description = version.description
        
        /// Then
        ///
        /// The description should match the expected format.
        #expect(description == "1.2.3")
    }
    
    @Test("SemanticVersion equality comparison")
    func testEquality() {
        /// Given
        ///
        /// Two equal SemanticVersion instances.
        let version1 = SemanticVersion(major: 1, minor: 2, patch: 3)
        let version2 = SemanticVersion(major: 1, minor: 2, patch: 3)
        
        /// When
        ///
        /// Comparing the versions for equality.
        let isEqual = version1 == version2
        
        /// Then
        ///
        /// They should be considered equal.
        #expect(isEqual)
    }
    
    @Test("SemanticVersion less-than comparison")
    func testLessThanComparison() {
        /// Given
        ///
        /// Two SemanticVersion instances, where the first is less than the second.
        let version1 = SemanticVersion(major: 1, minor: 2, patch: 3)
        let version2 = SemanticVersion(major: 2, minor: 0, patch: 0)
        
        /// When
        ///
        /// Comparing the versions for ordering.
        let isLessThan = version1 < version2
        
        /// Then
        ///
        /// The first version should be less than the second.
        #expect(isLessThan)
    }
    
    @Test("SemanticVersion less-than comparison with minor and patch differences")
    func testLessThanComparisonMinorAndPatch() {
        /// Given
        ///
        /// Two SemanticVersion instances with varying minor and patch versions.
        let version1 = SemanticVersion(major: 1, minor: 2, patch: 3)
        let version2 = SemanticVersion(major: 1, minor: 3, patch: 0)
        
        /// When
        ///
        /// Comparing the versions for ordering.
        let isLessThan = version1 < version2
        
        /// Then
        ///
        /// The first version should be less than the second based on minor version.
        #expect(isLessThan)
    }
    
    @Test("Initialise with complete version string")
    func testInitialisationWithCompleteVersionString() {
        /// Given
        ///
        /// A valid version string literal.
        let version: SemanticVersion = "1.2.3"
        
        /// Then
        ///
        /// Validate that the version is initialised correctly.
        #expect(version.major == 1)
        #expect(version.minor == 2)
        #expect(version.patch == 3)
    }
    
    @Test("Initialise with partial version string")
    func testInitialisationWithPartialVersionString() {
        /// Given
        ///
        /// A valid partial version string literal.
        let version: SemanticVersion = "1.2"
        
        /// Then
        ///
        /// Validate that the minor component is set, and patch defaults to 0.
        #expect(version.major == 1)
        #expect(version.minor == 2)
        #expect(version.patch == 0)
    }
    
    @Test("Initialise with major-only version string")
    func testInitialisationWithMajorOnlyVersionString() {
        /// Given
        ///
        /// A valid version string containing only the major component.
        let version: SemanticVersion = "1"
        
        /// Then
        ///
        /// Validate that minor and patch default to 0.
        #expect(version.major == 1)
        #expect(version.minor == 0)
        #expect(version.patch == 0)
    }
    
    @Test("Initialise with empty version string")
    func testInitialisationWithEmptyVersionString() {
        /// Given
        ///
        /// An empty version string literal.
        let version: SemanticVersion = ""
        
        /// Then
        ///
        /// Validate that all components default to 0.
        #expect(version.major == 0)
        #expect(version.minor == 0)
        #expect(version.patch == 0)
    }
    
    @Test("Initialise with malformed version string")
    func testInitialisationWithMalformedVersionString() {
        /// Given
        ///
        /// A malformed version string literal.
        let version: SemanticVersion = "1.two.3"
        
        /// Then
        ///
        /// Validate that the numeric components are parsed, and non-numeric parts are ignored.
        #expect(version.major == 1)
        #expect(version.minor == 0) // Fallback to 0 due to malformed data.
        #expect(version.patch == 3) // Fallback to 0 due to malformed data.
    }
    
    @Test("Initialise with excessive components")
    func testInitialisationWithExcessiveComponents() {
        /// Given
        ///
        /// A version string literal with more than three components.
        let version: SemanticVersion = "1.2.3.4.5"
        
        /// Then
        ///
        /// Validate that only the first three components are parsed.
        #expect(version.major == 1)
        #expect(version.minor == 2)
        #expect(version.patch == 3)
    }
}
