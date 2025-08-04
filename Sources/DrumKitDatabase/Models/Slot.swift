// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Slot
import struct DrumKit.Event

extension Slot.Identified {
	static func predicate(eventID: Event.ID) -> Predicate<Self> {
		\.event.id == eventID
	}
}
