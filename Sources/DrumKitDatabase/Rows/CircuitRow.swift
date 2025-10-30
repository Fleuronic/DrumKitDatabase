// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import PersistDB
import Identity
import struct DrumKit.Circuit
import struct DrumKitService.IdentifiedCircuit
import struct Catena.IDFields
import protocol Catenoid.Row

public struct CircuitRow {
	public let id: Circuit.ID

	private let name: String
	private let abbreviation: String
	private let url: URL?
}

// MARK: -
public extension CircuitRow {
	init(
		id: Circuit.ID?, 
		name: String? = nil,
		abbreviation: String? = nil,
		url: URL? = nil
	) {
		self.id = id ?? .null
		self.name = name ?? ""
		self.abbreviation = abbreviation ?? ""
		self.url = url
	}
}

// MARK: -
extension CircuitRow: Row {
	// MARK: Valued
	public typealias Value = Circuit

	// MARK: Representable
	public var value: Value {
		.init(
			name: name,
			abbreviation: abbreviation,
			url: url
		)
	}

	// MARK: Model
	public var identifiedModelID: Circuit.ID? { id }

	public var valueSet: ValueSet<Circuit.Identified> {
		var valueSet: ValueSet<Circuit.Identified> = [
			\.value.name == name,
			\.value.abbreviation == abbreviation
		]

		url.map { valueSet = valueSet.update(with: [\.value.url == $0]) }

		return valueSet
	}
}
