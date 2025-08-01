// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import struct DrumKit.Event
import struct DrumKit.Corps
import struct DrumKit.Ensemble
import struct DrumKit.Circuit
import struct DrumKit.Location
import struct DrumKit.State
import struct DrumKit.Location
import struct DrumKit.Show
import struct DrumKit.Venue
import struct DrumKit.Address
import struct DrumKit.ZIPCode
import struct DrumKit.Slot
import struct DrumKit.Performance
import struct DrumKit.Placement
import struct DrumKit.Division
import struct DrumKit.Feature
import protocol DrumKitService.EventFields
import protocol DrumKitService.ShowFields
import protocol DrumKitService.LocationFields
import protocol DrumKitService.SlotFields
import protocol DrumKitService.CorpsFields
import protocol DrumKitService.FeatureFields
import protocol Catenoid.Database
import protocol Catenoid.Fields
import protocol Caesura.Storage

public struct Database<
	EventSpecifiedFields: EventFields & Fields<Event.Identified>,
	ShowSpecifiedFields: ShowFields & Fields<Show.Identified>,
	LocationSpecifiedFields: LocationFields & Fields<Location.Identified>,
	SlotSpecifiedFields: SlotFields & Fields<Slot.Identified>,
	CorpsSpecifiedFields: CorpsFields & Fields<Corps.Identified>,
	FeatureSpecifiedFields: FeatureFields & Fields<Feature.Identified>
>: @unchecked Sendable {
	public let store: Store<ReadWrite>
}

public extension Database {
	func specifyingEventFields<Fields>(_: Fields.Type) -> Database<
		Fields,
		ShowSpecifiedFields,
		LocationSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingShowFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		Fields,
		LocationSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingLocationFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		ShowSpecifiedFields,
		Fields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingSlotFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		ShowSpecifiedFields,
		LocationSpecifiedFields,
		Fields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingCorpsFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		ShowSpecifiedFields,
		LocationSpecifiedFields,
		SlotSpecifiedFields,
		Fields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingFeatureFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		ShowSpecifiedFields,
		LocationSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		Fields
	> {
		.init(store: store)
	}
}

// MARK: -
public extension Database<
	Event.IDFields,
	Show.IDFields,
	Location.IDFields,
	Slot.IDFields,
	Corps.IDFields,
	Feature.IDFields
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
			Location.Identified.self,
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
		store.delete(Delete<Location.Identified>(nil))
	}
}

extension Database: Storage {
	public typealias StorageError = Never
}
