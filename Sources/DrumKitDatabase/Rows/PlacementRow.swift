// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Placement
import struct DrumKit.Division
import struct DrumKitService.IdentifiedPlacement
import struct Catena.IDFields
import protocol Catenoid.Row

public struct PlacementRow {
	public let id: Placement.ID

	private let rank: Int
	private let score: Double
	private let division: Division.IDFields
}

public extension PlacementRow {
	init(
		id: Placement.ID?,
		rank: Int? = nil,
		score: Double? = nil,
		division: Division.IDFields? = nil
	) {
		self.id = id ?? .null
		self.rank = rank ?? 0
		self.score = score ?? 0
		self.division = division ?? .null
	}
}

// MARK: -
extension PlacementRow: Row {
	// MARK: Valued
	public typealias Value = Placement

	// MARK: Representable
	public var value: Value {
		.init(
			rank: rank,
			score: score
		)
	}

	// MARK: Model
	public var identifiedModelID: Placement.ID? { id }

	public var valueSet: ValueSet<Placement.Identified> {
		[
			\.value.rank == rank,
			\.value.score == score,
			\.division == division.id
		]
	}
}
