// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Show
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.ShowSpec

extension Database: ShowSpec where ShowSpecifiedFields: Decodable {
	public func fetchShow(named name: String) async -> SingleResult<ShowSpecifiedFields?> {
		let results: Results<ShowSpecifiedFields> = await fetch(
			where: Show.Identified.predicate(name: name)
		)

		return results.map(\.first)
	}
}
