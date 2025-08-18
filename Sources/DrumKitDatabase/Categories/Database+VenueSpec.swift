// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Venue
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.VenueSpec

extension Database: VenueSpec where VenueSpecifiedFields: Decodable {
	public typealias VenueFetch = SingleResult<VenueSpecifiedFields?>
}
