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
	/// The season's latest dates, newest first.
	func listEventDates(
		for year: Int,
		includingCircuitsNamed names: Set<String> = [],
		orAbbreviated abbreviations: Set<String> = [],
		onOrBefore date: Date? = nil,
		excludingShowsNamed excluded: [String] = [],
		mostRecent limit: Int
	) async -> Results<EventSpecifiedFields> {
		await fetchAnonymous(
			where: Event.Identified.predicate(
				year: year,
				includedCircuitNames: names,
				includedCircuitAbbreviations: abbreviations,
				on: date,
				excludingShowsNamed: excluded
			),
			sortedBy: \.value.date,
			ascending: false,
			limit: limit
		)
	}

	/// The distinct circuits holding an event in the season.
	func listCircuits(for year: Int) async -> Results<EventSpecifiedFields> {
		await fetchAnonymous(
			where: Event.Identified.predicate(
				year: year,
				includedCircuitNames: [],
				includedCircuitAbbreviations: []
			)
		)
	}

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
