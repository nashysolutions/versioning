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
    
    /// Tests that versions with trailing `.0` components are treated as equal.
    ///
    /// - Example: `1.2.0` and `1.2` should be equal.
    /// - Verifies: Normalised equality trimming trailing zeroes.
    @Test("SemanticVersion equality with trailing zero components")
    func testEqualityWithTrailingZeros() {
        #expect(SemanticVersion(major: 1, minor: 2, patch: 0) == SemanticVersion(major: 1, minor: 2))
        #expect(SemanticVersion(major: 1, minor: 0, patch: 0) == SemanticVersion(major: 1))
        #expect(SemanticVersion(major: 1, minor: 2, patch: 0) == "1.2")
        #expect(SemanticVersion(major: 1) == "1.0.0")
    }
    
    /// Tests that versions with non-zero patch components differ from normalised forms.
    ///
    /// - Example: `1.2.1` and `1.2` should not be equal.
    /// - Verifies: Patch significance is respected when non-zero.
    @Test("SemanticVersion inequality with non-zero trailing components")
    func testInequalityWithNonZeroTrailingComponents() {
        #expect(SemanticVersion(major: 1, minor: 2, patch: 1) != SemanticVersion(major: 1, minor: 2))
        #expect(SemanticVersion(major: 1, minor: 0, patch: 1) != SemanticVersion(major: 1))
        #expect(SemanticVersion(major: 1, minor: 2, patch: 3) != "1.2.0")
    }
    
    /// Tests ordering comparisons where normalisation affects component interpretation.
    ///
    /// - Ensures that `.0` values are correctly considered in comparisons like `<`, `>`, `<=`, `>=`.
    @Test("SemanticVersion less-than and greater-than with normalised values")
    func testComparisonWithTrailingZeros() {
        #expect(SemanticVersion(major: 1, minor: 2) < SemanticVersion(major: 1, minor: 2, patch: 1))
        #expect(SemanticVersion(major: 1) < SemanticVersion(major: 1, minor: 0, patch: 1))
        #expect(SemanticVersion(major: 1, minor: 2) <= SemanticVersion(major: 1, minor: 2, patch: 0))
        #expect(SemanticVersion(major: 1, minor: 2, patch: 0) >= SemanticVersion(major: 1, minor: 2))
        #expect(SemanticVersion(major: 1, minor: 2, patch: 1) > SemanticVersion(major: 1, minor: 2))
        #expect(SemanticVersion(major: 2) > SemanticVersion(major: 1, minor: 9, patch: 9))
    }
    
    /// Tests comparison between versions of different component lengths that normalise to the same or differing values.
    ///
    /// - Example: `1.2` and `1.2.0` should be equal; `1.2` < `1.2.3`.
    @Test("SemanticVersion comparison where differing lengths require zero-padding")
    func testComparisonWithDifferentLengths() {
        let short = SemanticVersion(major: 1, minor: 2)     // interpreted as 1.2.0
        let long = SemanticVersion(major: 1, minor: 2, patch: 3)
        let equalForm = SemanticVersion(major: 1, minor: 2, patch: 0)
        
        #expect(short < long)
        #expect(short == equalForm)
    }
    
    /// Fuzz test verifying that versions with missing patch values are equal to those with `.0` patches.
    ///
    /// - Randomises major/minor components and confirms normalised equality.
    @Test("Fuzz test: equality with trailing zero components")
    func fuzzEqualityTrailingZeros() {
        for _ in 0..<100 {
            let major = Int.random(in: 0...10)
            let minor = Int.random(in: 0...10)
            
            let a = SemanticVersion(major: major, minor: minor)
            let b = SemanticVersion(major: major, minor: minor, patch: 0)
            
            #expect(a == b)
        }
    }
    
    /// Fuzz test ensuring that a patch value makes versions unequal, even when major/minor match.
    ///
    /// - Generates `SemanticVersion`s that differ only in patch.
    @Test("Fuzz test: inequality with random differing patch values")
    func fuzzInequalityWithDifferentPatches() {
        for _ in 0..<100 {
            let major = Int.random(in: 0...5)
            let minor = Int.random(in: 0...5)
            let patch = Int.random(in: 1...5) // ensure it's non-zero
            
            let base = SemanticVersion(major: major, minor: minor)
            let variant = SemanticVersion(major: major, minor: minor, patch: patch)
            
            #expect(base != variant)
            #expect(base < variant)
            #expect(variant > base)
        }
    }
    
    /// Fuzz test confirming that converting a version to a string and back preserves equality.
    ///
    /// - Tests the consistency of `description` and `stringLiteral` initialisation.
    @Test("Fuzz test: string round-trip preserves equality")
    func fuzzRoundTripStringConversion() {
        for _ in 0..<100 {
            let major = Int.random(in: 0...10)
            let minor = Int.random(in: 0...10)
            let patch = Int.random(in: 0...10)
            
            let version = SemanticVersion(major: major, minor: minor, patch: patch)
            let string = version.description
            let parsed = SemanticVersion(stringLiteral: string)
            
            #expect(version == parsed)
        }
    }
}
