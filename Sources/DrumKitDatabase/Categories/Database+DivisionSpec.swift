// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Division
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.DivisionSpec

extension Database: DivisionSpec where DivisionSpecifiedFields: Decodable {
	public typealias DivisionFetch = SingleResult<DivisionSpecifiedFields?>
}
