// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Location
import struct DrumKit.State
import struct DrumKitService.IdentifiedLocation
import struct Catena.IDFields
import protocol Catenoid.Row

public struct LocationRow {
	public let id: Location.ID

	private let city: String
	private let state: State.IDFields
}

public extension LocationRow {
	init(
		id: Location.ID?,
		city: String? = nil,
		state: State.IDFields? = nil
	) {
		self.id = id ?? .null
		self.city = city ?? ""
		self.state = state ?? .null
	}
}

// MARK: -
extension LocationRow: Row {
	// MARK: Valued
	public typealias Value = Location

	// MARK: Representable
	public var value: Value {
		.init(city: city)
	}

	// MARK: Model
	public var identifiedModelID: Location.ID? { id }

	public var valueSet: ValueSet<Location.Identified> {
		[
			\.value.city == city,
			\.state == state.id
		]
	}
}
