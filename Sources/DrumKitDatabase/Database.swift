// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import DrumKit
import DrumKitService
import protocol Catenoid.Database
import protocol Caesura.Storage

public struct Database<
	EventSpecifiedFields: EventFields,
	LocationSpecifiedFields: LocationFields,
	StateSpecifiedFields: StateFields,
	CountrySpecifiedFields: CountryFields,
	CircuitSpecifiedFields: CircuitFields,
	ShowSpecifiedFields: ShowFields,
	VenueSpecifiedFields: VenueFields,
	AddressSpecifiedFields: AddressFields,
	ZIPCodeSpecifiedFields: ZIPCodeFields,
	SlotSpecifiedFields: SlotFields,
	CorpsSpecifiedFields: CorpsFields,
	FeatureSpecifiedFields: FeatureFields,
	EnsembleSpecifiedFields: EnsembleFields,
	DivisionSpecifiedFields: DivisionFields,
	PlacementSpecifiedFields: PlacementFields,
	CorpsEraSpecifiedFields: CorpsEraFields,
	DivisionRankSpecifiedFields: DivisionRankFields,
	DivisionSubordinationSpecifiedFields: DivisionSubordinationFields,
	FeatureRoleSpecifiedFields: FeatureRoleFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingVenueFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		Fields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingAddressFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		Fields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingZIPCodeFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		Fields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		Fields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		Fields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
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
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		Fields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingEnsembleFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		Fields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingDivisionFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		Fields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingPlacementFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		Fields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingCorpsEraFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		Fields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingDivisionRankFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		Fields,
		DivisionSubordinationSpecifiedFields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingDivisionSubordinationFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		Fields,
		FeatureRoleSpecifiedFields
	> {
		.init(store: store)
	}

	func specifyingFeatureRoleFields<Fields>(_: Fields.Type) -> Database<
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		SlotSpecifiedFields,
		CorpsSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		DivisionSpecifiedFields,
		PlacementSpecifiedFields,
		CorpsEraSpecifiedFields,
		DivisionRankSpecifiedFields,
		DivisionSubordinationSpecifiedFields,
		Fields
	> {
		.init(store: store)
	}
}

// MARK: -
public extension Database {
	init() async {
		store = try! await Self.createStore(named: "DrumKit")

		createIndexes()
		store.analyze()
		await seedNullObjects()
	}
}

// MARK: -
private extension Database {
	func createIndexes() {
		store.createIndex("ix_events_date", on: "events", columns: ["date"])
		store.createIndex("ix_slots_event", on: "slots", columns: ["event"])
		store.createIndex("ix_slots_perf", on: "slots", columns: ["performance"])
		store.createIndex("ix_perf_corps", on: "performances", columns: ["corps"])
		store.createIndex("ix_perf_ens", on: "performances", columns: ["ensemble"])
		store.createIndex("ix_perf_pl", on: "performances", columns: ["placement"])
		store.createIndex("ix_loc_state", on: "locations", columns: ["state"])
		store.createIndex("ix_state_country", on: "states", columns: ["country"])
		store.createIndex("ix_div_circ", on: "divisions", columns: ["circuit"])
		store.createIndex("ix_c_loc", on: "corps", columns: ["location"])
		store.createIndex("ix_en_loc", on: "ensembles", columns: ["location"])
		store.createIndex("ix_pl_div", on: "placements", columns: ["division"])
	}

	func seedNullObjects() async {
		_ = await insert(CountryRow(id: nil))
		_ = await insert(StateRow(id: nil))
		_ = await insert(LocationRow(id: nil))
		_ = await insert(ZIPCodeRow(id: nil, code: nil))
		_ = await insert(AddressRow(id: nil, streetAddress: nil, location: nil, zipCode: nil))
		_ = await insert(CircuitRow(id: nil))
		_ = await insert(ShowRow(id: nil, name: nil))
		_ = await insert(VenueRow(id: nil, name: nil, host: nil, address: nil))
		_ = await insert(DivisionRow(id: nil))
		_ = await insert(FeatureRow(id: nil, name: nil))
		_ = await insert(CorpsRow(id: nil))
		_ = await insert(EnsembleRow(id: nil))
		_ = await insert(PlacementRow(id: nil))
		_ = await insert(PerformanceRow(id: nil))
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
			Feature.Identified.self,
			CorpsEra.Identified.self,
			DivisionRank.Identified.self,
			DivisionSubordination.Identified.self,
			FeatureRole.Identified.self
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
