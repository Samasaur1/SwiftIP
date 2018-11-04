import XCTest

extension SwiftIPTests {
    static let __allTests = [
        ("testExample", testExample),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftIPTests.__allTests),
    ]
}
#endif
