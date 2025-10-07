// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Division
import struct DrumKit.Circuit
import struct DrumKitService.IdentifiedDivision
import struct Catena.IDFields
import protocol Catenoid.Row

public struct DivisionRow {
	public let id: Division.ID

	private let name: String
	private let circuit: Circuit.IDFields
}

// MARK: -
public extension DivisionRow {
	init(
		id: Division.ID?, 
		name: String? = nil,
		circuit: Circuit.IDFields? = nil
	) {
		self.id = id ?? .null
		self.name = name ?? ""
		self.circuit = circuit ?? .null
	}
}

// MARK: -
extension DivisionRow: Row {
	// MARK: Valued
	public typealias Value = Division

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var identifiedModelID: Division.ID? { id }

	public var valueSet: ValueSet<Division.Identified> {
		[
			\.value.name == name,
			\.circuit == circuit.id
		]
	}
}
