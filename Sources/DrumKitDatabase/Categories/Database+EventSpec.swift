// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Event
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.EventSpec

extension Database: EventSpec where EventSpecifiedFields: Decodable {
	public typealias EventList = Results<EventSpecifiedFields>
}
