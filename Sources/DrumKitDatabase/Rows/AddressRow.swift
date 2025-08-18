// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Address
import struct DrumKit.Location
import struct DrumKit.ZIPCode
import struct DrumKitService.IdentifiedAddress
import struct Catena.IDFields
import protocol Catenoid.Row

public struct AddressRow {
	public let id: Address.ID

	private let streetAddress: String
	private let location: Location.IDFields
	private let zipCode: ZIPCode.IDFields
}

public extension AddressRow {
	init(
		id: Address.ID?,
		streetAddress: String?,
		location: Location.IDFields?,
		zipCode: ZIPCode.IDFields?
	) {
		self.id = id ?? .null
		self.streetAddress = streetAddress ?? ""
		self.location = location ?? .null
		self.zipCode = zipCode ?? .null
	}
}

// MARK: -
extension AddressRow: Row {
	// MARK: Valued
	public typealias Value = Address

	// MARK: Representable
	public var value: Value {
		.init(streetAddress: streetAddress)
	}

	// MARK: Model
	public var identifiedModelID: Address.ID? { id }

	public var valueSet: ValueSet<Address.Identified> {
		[
			\.value.streetAddress == streetAddress,
			\.location == location.id,
			\.zipCode == zipCode.id
		]
	}
}
