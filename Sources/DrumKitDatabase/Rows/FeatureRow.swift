// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Feature
import struct DrumKit.Location
import struct DrumKitService.IdentifiedFeature
import struct Catena.IDFields
import protocol Catenoid.Row

public struct FeatureRow {
	public let id: Feature.ID

	private let name: String
}

// MARK: -
public extension FeatureRow {
	init(
		id: Feature.ID?, 
		name: String?
	) {
		self.id = id ?? .null
		self.name = name ?? ""
	}
}

// MARK: -
extension FeatureRow: Row {
	// MARK: Valued
	public typealias Value = Feature

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var identifiedModelID: Feature.ID? { id }

	public var valueSet: ValueSet<Feature.Identified> {
		[\.value.name == name]
	}
}
