// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.State
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.StateSpec

extension Database: StateSpec where StateSpecifiedFields: Decodable {
	public typealias StateFetch = SingleResult<StateSpecifiedFields?>
}
