// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.CorpsEra
import struct DrumKit.Corps
import struct DrumKit.Location
import struct DrumKit.Division
import struct DrumKitService.IdentifiedCorpsEra
import struct Catena.IDFields
import protocol Catenoid.Row

public struct CorpsEraRow {
	public let id: CorpsEra.ID

	private let fromYear: Int?
	private let throughYear: Int?
	private let name: String?
	private let corps: Corps.IDFields
	private let location: Location.IDFields
	private let division: Division.IDFields

	public init(
		id: CorpsEra.ID,
		fromYear: Int?,
		throughYear: Int?,
		name: String?,
		corps: Corps.IDFields,
		location: Location.IDFields? = nil,
		division: Division.IDFields? = nil
	) {
		self.id = id
		self.fromYear = fromYear
		self.throughYear = throughYear
		self.name = name
		self.corps = corps
		self.location = location ?? .null
		self.division = division ?? .null
	}
}

// MARK: -
extension CorpsEraRow: Row {
	// MARK: Valued
	public typealias Value = CorpsEra

	// MARK: Representable
	public var value: Value {
		.init(
			fromYear: fromYear,
			throughYear: throughYear,
			name: name
		)
	}

	// MARK: Model
	public var identifiedModelID: CorpsEra.ID? { id }

	public var valueSet: ValueSet<CorpsEra.Identified> {
		[
			\.value.fromYear == fromYear,
			\.value.throughYear == throughYear,
			\.value.name == name,
			\.corps == corps.id,
			\.location == location.id,
			\.division == division.id
		]
	}
}
