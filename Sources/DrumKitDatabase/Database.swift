// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import DrumKit
import DrumKitService
import protocol Catenoid.Database
import protocol Catenoid.Fields
import protocol Caesura.Storage

public struct Database<
	EventSpecifiedFields: EventFields & Fields<Event.Identified>,
	LocationSpecifiedFields: LocationFields & Fields<Location.Identified>,
	StateSpecifiedFields: StateFields & Fields<State.Identified>,
	CountrySpecifiedFields: CountryFields & Fields<Country.Identified>,
	CircuitSpecifiedFields: CircuitFields & Fields<Circuit.Identified>,
	ShowSpecifiedFields: ShowFields & Fields<Show.Identified>,
	SlotSpecifiedFields: SlotFields & Fields<Slot.Identified>,
	CorpsSpecifiedFields: CorpsFields & Fields<Corps.Identified>,
	FeatureSpecifiedFields: FeatureFields & Fields<Feature.Identified>
>: @unchecked Sendable {
	public let store: Store<ReadWrite>
}

public extension Database {
	func specifyingEventFields<Fields>(_: Fields.Type) -> Database<
		Fields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingLocationFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		Fields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingStateFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		Fields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingCountryFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		Fields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingCircuitFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		Fields,
		ShowSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingShowFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		Fields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingSlotFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		Fields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingCorpsFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		SlotSpecifiedFields,
		Fields,
		FeatureSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingFeatureFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
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
	Location.IDFields,
	State.IDFields,
	Country.IDFields,
	Circuit.IDFields,
	Show.IDFields,
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
			Location.Identified.self,
			State.Identified.self,
			Address.Identified.self,
			ZIPCode.Identified.self,
			Country.Identified.self,
			Circuit.Identified.self,
			Show.Identified.self,
			Venue.Identified.self,
			Slot.Identified.self,
			Corps.Identified.self,
			Ensemble.Identified.self,
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
