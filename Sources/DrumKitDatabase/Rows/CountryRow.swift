// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Country
import struct DrumKitService.IdentifiedCountry
import struct Catena.IDFields
import protocol Catenoid.Row

public struct CountryRow {
	public let id: Country.ID

	private let name: String
}

// MARK: -
public extension CountryRow {
	init(
		id: Country.ID?,
		name: String? = nil
	) {
		self.id = id ?? .null
		self.name = name ?? ""
	}
}

// MARK: -
extension CountryRow: Row {
	// MARK: Valued
	public typealias Value = Country

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var identifiedModelID: Country.ID? { id }

	public var valueSet: ValueSet<Country.Identified> {
		[\.value.name == name]
	}
}
