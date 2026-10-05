// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct DrumKit.Event
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol Catenoid.AnonymousFields
import protocol DrumKitService.EventSpec

extension Database: EventSpec where EventSpecifiedFields: Fields<Event.Identified> & Decodable {
	public typealias EventList = Results<EventSpecifiedFields>
	public typealias EventFetch = SingleResult<EventSpecifiedFields?>
}

// MARK: -
public extension Database where EventSpecifiedFields: AnonymousFields<Event.Identified> {
	func listSeasonEvents(in year: Int) async -> Results<EventSpecifiedFields> {
		await fetchAnonymous(
			where: Event.Identified.predicate(
				year: year,
				includedCircuitNames: [],
				includedCircuitAbbreviations: []
			),
			distinct: false
		)
	}
}
