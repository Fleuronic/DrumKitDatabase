// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.Slot
import struct DrumKit.Time
import struct DrumKit.Event
import struct DrumKit.Feature
import struct DrumKit.Performance
import struct DrumKitService.IdentifiedSlot
import struct Catena.IDFields
import protocol Catenoid.Row

public struct SlotRow {
	public let id: Slot.ID

	private let time: Time?
	private let event: Event.IDFields
	private let performance: Performance.IDFields
	private let feature: Feature.IDFields

	public init(
		id: Slot.ID,
		time: Time? = nil,
		event: Event.IDFields,
		performance: Performance.IDFields? = nil,
		feature: Feature.IDFields? = nil,
	) {
		self.id = id
		self.time = time
		self.event = event
		self.performance = performance ?? .null
		self.feature = feature ?? .null
	}
}

// MARK: -
extension SlotRow: Row {
	// MARK: Valued
	public typealias Value = Slot

	// MARK: Representable
	public var value: Value {
		.init(time: time)
	}

	// MARK: Model
	public var identifiedModelID: Slot.ID? { id }

	public var valueSet: ValueSet<Slot.Identified> {
		[
			\.value.time == time,
			\.event == event.id,
			\.feature == feature.id,
			\.performance == performance.id
		]
	}
}
