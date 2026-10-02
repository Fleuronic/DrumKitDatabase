// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.DivisionRank
import struct DrumKit.Division
import struct DrumKitService.IdentifiedDivisionRank
import struct Catena.IDFields
import protocol Catenoid.Row

public struct DivisionRankRow {
	public let id: DivisionRank.ID

	private let rank: Int
	private let division: Division.IDFields

	public init(
		id: DivisionRank.ID,
		rank: Int,
		division: Division.IDFields
	) {
		self.id = id
		self.rank = rank
		self.division = division
	}
}

// MARK: -
extension DivisionRankRow: Row {
	// MARK: Valued
	public typealias Value = DivisionRank

	// MARK: Representable
	public var value: Value {
		.init(rank: rank)
	}

	// MARK: Model
	public var identifiedModelID: DivisionRank.ID? { id }

	public var valueSet: ValueSet<DivisionRank.Identified> {
		[
			\.value.rank == rank,
			\.division == division.id
		]
	}
}
