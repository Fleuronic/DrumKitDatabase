// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import Catena
import struct DrumKit.Event
import struct DrumKit.Corps
import struct DrumKit.Ensemble
import struct DrumKit.Circuit
import struct DrumKit.Location
import struct DrumKit.State
import struct DrumKit.Country
import struct DrumKit.Show
import struct DrumKit.Venue
import struct DrumKit.Address
import struct DrumKit.ZIPCode
import struct DrumKit.Slot
import struct DrumKit.Performance
import struct DrumKit.Placement
import struct DrumKit.Division
import struct DrumKit.Feature
import protocol DrumKitService.CorpsFields
import protocol DrumKitService.SlotFields
import protocol DrumKitService.EventFields
import protocol Catenoid.Database
import protocol Catenoid.Fields
import protocol Caesura.Storage

public struct Database<
	EventSpecifiedFields: EventFields & Fields<Event.Identified>,
	SlotSpecifiedFields: SlotFields & Fields<Slot.Identified>,
	CorpsSpecifiedFields: CorpsFields & Fields<Corps.Identified>,
>: @unchecked Sendable {
	public let store: Store<ReadWrite>
}

public extension Database {
	func specifyingEventFields<Fields>(_: Fields.Type) -> Database<
		Fields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingSlotFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		Fields,
		CorpsSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingCorpsFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		SlotSpecifiedFields,
		Fields
	> {
		.init(store: store)
	}
}

// MARK: -
public extension Database<
	Event.IDFields,
	Slot.IDFields,
	Corps.IDFields
> {
	init() async {
		store = try! await Self.createStore(named: "DrumKit")
	}
}

// MARK: -
extension Database: Catenoid.Database {
	public static var types: [any AnyModel.Type] {
		[
			Event.Identified.self,
			Corps.Identified.self,
			Ensemble.Identified.self,
			Circuit.Identified.self,
			Location.Identified.self,
			State.Identified.self,
			Country.Identified.self,
			Show.Identified.self,
			Venue.Identified.self,
			Address.Identified.self,
			ZIPCode.Identified.self,
			Slot.Identified.self,
			Performance.Identified.self,
			Placement.Identified.self,
			Division.Identified.self,
			Feature.Identified.self
		]
	}

	public func clear() async {
		store.delete(Delete<Event.Identified>(nil))
		store.delete(Delete<Corps.Identified>(nil))
		store.delete(Delete<Location.Identified>(nil))
		store.delete(Delete<State.Identified>(nil))
		store.delete(Delete<Country.Identified>(nil))
	}
}

extension Database: Storage {
	public typealias StorageError = Never
}
