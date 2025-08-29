// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Foundation
import struct DrumKit.Slot
import struct DrumKit.Event

extension Slot.Identified {
	static func predicate(year: Int) -> PersistDB.Predicate<Self> {
		let calendar = Calendar.current
		let startOfYear = DateComponents(calendar: calendar, year: year).date!
		let endOfYear = calendar.date(byAdding: .year, value: 1, to: startOfYear)!
		return \.event.value.date > startOfYear && \.event.value.date < endOfYear
	}
}
