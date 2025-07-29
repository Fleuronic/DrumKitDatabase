// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.State
import struct DrumKit.Country
import struct DrumKitService.IdentifiedState
import struct Catena.IDFields
import protocol Catenoid.Row

public struct StateRow {
	public let id: State.ID

	private let abbreviation: String
	private let country: Country.IDFields
}

// MARK: -
public extension StateRow {
	init(
		id: State.ID?,
		abbreviation: String? = nil,
		country: Country.IDFields? = nil
	) {
		self.id = id ?? .null
		self.abbreviation = abbreviation ?? ""
		self.country = country ?? .null
	}
}

// MARK: -
extension StateRow: Row {
	// MARK: Valued
	public typealias Value = State

	// MARK: Representable
	public var value: Value {
		.init(abbreviation: abbreviation)
	}

	// MARK: Model
	public var identifiedModelID: State.ID? { id }

	public var valueSet: ValueSet<State.Identified> {
		[
			\.value.abbreviation == abbreviation,
			\.country == country.id
		]
	}
}
