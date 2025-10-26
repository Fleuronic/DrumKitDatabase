// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import PersistDB
import Identity
import Foundation
import struct DrumKit.Event
import struct DrumKit.Circuit
import struct DrumKit.Location
import struct DrumKit.Show
import struct DrumKit.Venue
import struct DrumKitService.IdentifiedEvent
import struct Catena.IDFields
import protocol Catenoid.Row

public struct EventRow {
	public let id: Event.ID

	private let date: Date
	private let detailsURL: URL?
	private let scoresURL: URL?
	private let location: Location.IDFields
	private let circuit: Circuit.IDFields
	private let show: Show.IDFields
	private let venue: Venue.IDFields
}

public extension EventRow {
	init(
		id: Event.ID?,
		date: Date,
		detailsURL: URL? = nil,
		scoresURL: URL? = nil,
		location: Location.IDFields? = nil,
		circuit: Circuit.IDFields? = nil,
		show: Show.IDFields? = nil,
		venue: Venue.IDFields? = nil
	) {
		self.id = id ?? .null
		self.date = date
		self.detailsURL = detailsURL
		self.scoresURL = scoresURL
		self.location = location ?? .null
		self.circuit = circuit ?? .null
		self.show = show ?? .null
		self.venue = venue ?? .null
	}
}

// MARK: -
extension EventRow: Row {
	// MARK: Valued
	public typealias Value = Event

	// MARK: Representable
	public var value: Value {
		.init(
			date: date,
			detailsURL: detailsURL,
			scoresURL: scoresURL
		)
	}

	// MARK: Model
	public var identifiedModelID: Event.ID? { id }

	public var valueSet: ValueSet<Event.Identified> {
		[
			\.value.date == date,
			\.value.scoresURL == scoresURL,
			\.value.detailsURL == detailsURL,
			\.location == location.id,
			\.circuit == circuit.id,
			\.show == show.id,
			\.venue == venue.id
		]
	}
}
