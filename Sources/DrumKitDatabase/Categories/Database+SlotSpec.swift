// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Slot
import struct DrumKit.Event
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.SlotSpec

extension Database: SlotSpec where SlotSpecifiedFields: Decodable {
	public typealias SlotList = Results<SlotSpecifiedFields>
	public typealias SlotFetch = SingleResult<SlotSpecifiedFields?>
}
