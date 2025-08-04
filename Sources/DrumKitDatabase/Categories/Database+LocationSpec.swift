// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Location
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.LocationSpec

extension Database: LocationSpec where LocationSpecifiedFields: Decodable {
	public typealias LocationFetch = SingleResult<LocationSpecifiedFields?>
}
