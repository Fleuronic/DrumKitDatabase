// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.VenueEra
import struct DrumKit.Venue
import struct DrumKitService.IdentifiedVenueEra
import struct Catena.IDFields
import protocol Catenoid.Row

public struct VenueEraRow {
	public let id: VenueEra.ID

	private let fromYear: Int?
	private let throughYear: Int?
	private let name: String
	private let venue: Venue.IDFields

	public init(
		id: VenueEra.ID,
		fromYear: Int?,
		throughYear: Int?,
		name: String,
		venue: Venue.IDFields
	) {
		self.id = id
		self.fromYear = fromYear
		self.throughYear = throughYear
		self.name = name
		self.venue = venue
	}
}

// MARK: -
extension VenueEraRow: Row {
	// MARK: Valued
	public typealias Value = VenueEra

	// MARK: Representable
	public var value: Value {
		.init(
			fromYear: fromYear,
			throughYear: throughYear,
			name: name
		)
	}

	// MARK: Model
	public var identifiedModelID: VenueEra.ID? { id }

	public var valueSet: ValueSet<VenueEra.Identified> {
		[
			\.value.fromYear == fromYear,
			\.value.throughYear == throughYear,
			\.value.name == name,
			\.venue == venue.id
		]
	}
}
