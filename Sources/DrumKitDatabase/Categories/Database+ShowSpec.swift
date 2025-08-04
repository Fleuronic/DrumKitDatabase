// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Show
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.ShowSpec

extension Database: ShowSpec where ShowSpecifiedFields: Decodable {
	public typealias ShowFetch = SingleResult<ShowSpecifiedFields?>
}
