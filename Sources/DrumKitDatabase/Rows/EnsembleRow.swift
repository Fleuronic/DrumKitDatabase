// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Ensemble
import struct DrumKit.Location
import struct DrumKitService.IdentifiedEnsemble
import struct Catena.IDFields
import protocol Catenoid.Row

public struct EnsembleRow {
	public let id: Ensemble.ID

	private let name: String
	private let location: Location.IDFields
}

// MARK: -
public extension EnsembleRow {
	init(
		id: Ensemble.ID? = nil, 
		name: String? = nil, 
		location: Location.IDFields? = nil
	) {
		self.id = id ?? .null
		self.name = name ?? ""
		self.location = location ?? .null
	}
}

// MARK: -
extension EnsembleRow: Row {
	// MARK: Valued
	public typealias Value = Ensemble

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var identifiedModelID: Ensemble.ID? { id }

	public var valueSet: ValueSet<Ensemble.Identified> {
		[
			\.value.name == name,
			\.location == location.id
		]
	}
}
