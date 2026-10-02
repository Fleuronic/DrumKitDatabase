// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.FeatureRole
import struct DrumKit.Feature
import struct DrumKitService.IdentifiedFeatureRole
import struct Catena.IDFields
import protocol Catenoid.Row

public struct FeatureRoleRow {
	public let id: FeatureRole.ID

	private let role: String
	private let feature: Feature.IDFields

	public init(
		id: FeatureRole.ID,
		role: String,
		feature: Feature.IDFields
	) {
		self.id = id
		self.role = role
		self.feature = feature
	}
}

// MARK: -
extension FeatureRoleRow: Row {
	// MARK: Valued
	public typealias Value = FeatureRole

	// MARK: Representable
	public var value: Value {
		.init(role: role)
	}

	// MARK: Model
	public var identifiedModelID: FeatureRole.ID? { id }

	public var valueSet: ValueSet<FeatureRole.Identified> {
		[
			\.value.role == role,
			\.feature == feature.id
		]
	}
}
