// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Corps
import struct DrumKit.Location
import struct DrumKitService.IdentifiedCorps
import struct Catena.IDFields
import protocol Catenoid.Row

public struct CorpsRow {
	public let id: Corps.ID

	private let name: String
	private let location: Location.IDFields
}

// MARK: -
public extension CorpsRow {
	init(
		id: Corps.ID? = nil, 
		name: String? = nil, 
		location: Location.IDFields? = nil
	) {
		self.id = id ?? .null
		self.name = name ?? ""
		self.location = location ?? .null
	}
}

// MARK: -
extension CorpsRow: Row {
	// MARK: Valued
	public typealias Value = Corps

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var identifiedModelID: Corps.ID? { id }

	public var valueSet: ValueSet<Corps.Identified> {
		[
			\.value.name == name,
			\.location == location.id
		]
	}
}
