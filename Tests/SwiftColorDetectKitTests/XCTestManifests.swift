import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(swift_color_detectorTests.allTests),
    ]
}
#endif