// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Location
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.LocationSpec

extension Database: LocationSpec where LocationSpecifiedFields: Decodable {
	public func fetchLocation(
		city: String,
		state: String
	) async -> SingleResult<LocationSpecifiedFields?> {
		let results: Results<LocationSpecifiedFields> = await fetch(
			where: Location.Identified.predicate(
				city: city, 
				state: state
			)
		)

		return results.map(\.first)
	}
}
