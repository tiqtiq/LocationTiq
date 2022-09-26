import XCTest
import LocationTiq

final class LocationTiqTests: XCTestCase {
    func testLocation() async throws {
    }

    #if canImport(ObjectiveC) // needed for AutoreleasingUnsafeMutablePointer
    func testLocationFormatter() async throws {
        let ddcompact = {
            LocationDegreesFormatter(format: .decimalDegrees, displayOptions: .compact)!.string(from: $0)
        }
        XCTAssertEqual("0.0°", ddcompact(0))
        XCTAssertEqual("120.33°", ddcompact(120.33))
        XCTAssertEqual("-179.0°", ddcompact(-179))
        XCTAssertEqual(nil, ddcompact(-312.5434224))

        let degminsec = {
            LocationDegreesFormatter(format: .degreesMinutesSeconds, displayOptions: .compact)!.string(from: $0)
        }
        XCTAssertEqual("0°0\'0\"", degminsec(0))
        XCTAssertEqual("120°19\'48\"", degminsec(120.33))
        XCTAssertEqual("-179°0\'0\"", degminsec(-179))
        XCTAssertEqual(nil, degminsec(-312.5434224))

    }
    #endif
}
