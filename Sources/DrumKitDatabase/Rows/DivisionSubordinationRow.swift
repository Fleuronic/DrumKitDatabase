// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.DivisionSubordination
import struct DrumKit.Division
import struct DrumKit.Circuit
import struct DrumKitService.IdentifiedDivisionSubordination
import struct Catena.IDFields
import protocol Catenoid.Row

public struct DivisionSubordinationRow {
	public let id: DivisionSubordination.ID

	private let division: Division.IDFields
	private let circuit: Circuit.IDFields

	public init(
		id: DivisionSubordination.ID,
		division: Division.IDFields,
		circuit: Circuit.IDFields
	) {
		self.id = id
		self.division = division
		self.circuit = circuit
	}
}

// MARK: -
extension DivisionSubordinationRow: Row {
	// MARK: Valued
	public typealias Value = DivisionSubordination

	// MARK: Representable
	public var value: Value {
		.init()
	}

	// MARK: Model
	public var identifiedModelID: DivisionSubordination.ID? { id }

	public var valueSet: ValueSet<DivisionSubordination.Identified> {
		[
			\.division == division.id,
			\.circuit == circuit.id
		]
	}
}
