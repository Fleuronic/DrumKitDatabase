// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Country
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.CountrySpec

extension Database: CountrySpec where CountrySpecifiedFields: Decodable {
	public typealias CountryFetch = SingleResult<CountrySpecifiedFields?>
}
