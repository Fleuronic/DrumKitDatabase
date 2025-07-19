// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Show
import struct DrumKit.Address
import struct DrumKitService.IdentifiedShow
import struct Catena.IDFields
import protocol Catenoid.Row

public struct ShowRow {
	public let id: Show.ID

	private let name: String
}

// MARK: -
public extension ShowRow {
	init(
		id: Show.ID?,
		name: String?
	) {
		self.id = id ?? .null
		self.name = name ?? ""
	}
}

// MARK: -
extension ShowRow: Row {
	// MARK: Valued
	public typealias Value = Show

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var identifiedModelID: Show.ID? { id }

	public var valueSet: ValueSet<Show.Identified> {
		[\.value.name == name]
	}
}
