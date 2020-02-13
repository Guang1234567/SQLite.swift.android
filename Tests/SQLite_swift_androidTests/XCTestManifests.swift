import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SQLite_swift_androidTests.allTests),
    ]
}
#endif
