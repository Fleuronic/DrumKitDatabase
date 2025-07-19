// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import MemberwiseInit
import Identity
import Foundation
import struct DrumKit.Country
import struct DrumKitService.IdentifiedCountry
import struct Catena.IDFields
import protocol Catenoid.Row

@_UncheckedMemberwiseInit(.public)
public struct CountryRow {
	public let id: Country.ID

	@Init(default: "")
	private let name: String
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
