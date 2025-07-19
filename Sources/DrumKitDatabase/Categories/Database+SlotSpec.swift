// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Slot
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.SlotSpec

extension Database: SlotSpec where SlotSpecifiedFields: Decodable {
	public typealias SlotList = Results<SlotSpecifiedFields>
}
