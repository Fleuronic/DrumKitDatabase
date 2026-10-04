// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Circuit
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.CircuitSpec

extension Database: CircuitSpec where CircuitSpecifiedFields: Fields<Circuit.Identified> & Decodable {
	public typealias CircuitFetch = SingleResult<CircuitSpecifiedFields?>
}
