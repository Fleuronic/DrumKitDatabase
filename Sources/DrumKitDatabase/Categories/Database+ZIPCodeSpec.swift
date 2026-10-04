// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.ZIPCode
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.ZIPCodeSpec

extension Database: ZIPCodeSpec where ZIPCodeSpecifiedFields: Fields<ZIPCode.Identified> & Decodable {
	public typealias ZIPCodeFetch = SingleResult<ZIPCodeSpecifiedFields?>
}
