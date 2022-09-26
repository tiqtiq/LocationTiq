
#if canImport(CoreLocation)

import class CoreLocation.CLLocation
import struct CoreLocation.CLLocationCoordinate2D
import func CoreLocation.CLLocationCoordinate2DIsValid
import typealias CoreLocation.CLLocationDegrees

public typealias Degrees = CoreLocation.CLLocationDegrees

public typealias Location = CoreLocation.CLLocation

/// An abastraction of a latitude and longitude
///
/// Equivalent to `CoreLocation.CLLocationCoordinate2D` when `CoreLocation` can be imported.
public typealias Coordinate = CoreLocation.CLLocationCoordinate2D

extension Coordinate {
    /// Returns `true` if the specified coordinate is valid, `false` otherwise.
    public var isValid: Bool {
        CLLocationCoordinate2DIsValid(self)
    }
}

extension Location {
    public convenience init(latitude: Double, longitude: Double, altitude: Double = .nan) {
        self.init(coordinate: .init(latitude: latitude, longitude: longitude), altitude: altitude, horizontalAccuracy: .nan, verticalAccuracy: .nan, timestamp: .init(timeIntervalSinceReferenceDate: 0))
    }
}

#else // Linux, Windows, etc.

public typealias Degrees = Double

open class Location : Hashable {
    public var coordinate: Coordinate
    public var altitude: Double

    public init(latitude: Double, longitude: Double, altitude: Double = .nan) {
        self.coordinate = Coordinate(latitude: latitude, longitude: longitude)
        self.altitude = altitude
    }

    public static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.coordinate == rhs.coordinate
        && lhs.altitude == rhs.altitude
    }

    public func hash(into hasher: inout Hasher) {
        coordinate.hashValue.hash(into: &hasher)
        altitude.hashValue.hash(into: &hasher)
    }
}

/// An abastraction of a latitude and longitude
///
/// Equivalent to `CoreLocation.CLLocationCoordinate2D` when `CoreLocation` can be imported.
public struct Coordinate : Hashable, Sendable {
    public var latitude: Double
    public var longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Coordinate {
    /// Returns `true` if the specified coordinate is valid, `false` otherwise.
    public var isValid: Bool {
        if latitude > 90 || latitude < -90 {
            return false
        } else if longitude > 180 || longitude < -180 {
            return false
        } else {
            return true
        }
    }
}

#endif

