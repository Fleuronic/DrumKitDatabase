// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Performance
import struct DrumKit.Corps
import struct DrumKit.Ensemble
import struct DrumKit.Placement
import struct DrumKitService.IdentifiedPerformance
import struct Catena.IDFields
import protocol Catenoid.Row

public struct PerformanceRow {
	public let id: Performance.ID

	private let corps: Corps.IDFields
	private let ensemble: Ensemble.IDFields
	private let placement: Placement.IDFields

	public init(
		id: Performance.ID?,
		corps: Corps.IDFields? = nil,
		ensemble: Ensemble.IDFields? = nil,
		placement: Placement.IDFields? = nil
	) {
		self.id = id ?? .null
		self.corps = corps ?? .null
		self.ensemble = ensemble ?? .null
		self.placement = placement ?? .null
	}
}

// MARK: -
extension PerformanceRow: Row {
	// MARK: Valued
	public typealias Value = Performance

	// MARK: Representable
	public var value: Value {
		fatalError()
	}

	// MARK: Model
	public var identifiedModelID: Performance.ID? { id }

	public var valueSet: ValueSet<Performance.Identified> {
		[
			\.placement == placement.id,
			\.corps == corps.id,
			\.ensemble == ensemble.id
		]
	}
}
