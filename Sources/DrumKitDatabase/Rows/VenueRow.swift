// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Venue
import struct DrumKit.Address
import struct DrumKitService.IdentifiedVenue
import struct Catena.IDFields
import protocol Catenoid.Row

public struct VenueRow {
	public let id: Venue.ID

	private let name: String
	private let host: String?
	private let address: Address.IDFields
}

public extension VenueRow {
	init(
		id: Venue.ID?,
		name: String?,
		host: String?,
		address: Address.IDFields?
	) {
		self.id = id ?? .null
		self.name = name ?? ""
		self.host = host
		self.address = address ?? .null
	}
}

// MARK: -
extension VenueRow: Row {
	// MARK: Valued
	public typealias Value = Venue

	// MARK: Representable
	public var value: Value {
		.init(
			name: name,
			host: host
		)
	}

	// MARK: Model
	public var identifiedModelID: Venue.ID? { id }

	public var valueSet: ValueSet<Venue.Identified> {
		[
			\.value.name == name,
			\.value.host == host,
			\.address == address.id
		]
	}
}
