// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import PersistDB
import struct DrumKit.Slot
import struct DrumKit.Event
import struct DrumKit.Performance
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol Catenoid.AnonymousFields
import protocol DrumKitService.SlotSpec

extension Database: SlotSpec where SlotSpecifiedFields: Fields<Slot.Identified> & Decodable {
	public typealias SlotList = Results<SlotSpecifiedFields>
	public typealias SlotFetch = SingleResult<SlotSpecifiedFields?>
}

// MARK: -
public extension Database where SlotSpecifiedFields: AnonymousFields<Slot.Identified> {
	func listPerformanceSlots(in year: Int) async -> Results<SlotSpecifiedFields> {
		await fetchAnonymous(
			where: Slot.Identified.predicate(year: year) && \Slot.Identified.performance.id != Performance.ID.null,
			distinct: false
		)
	}
}
