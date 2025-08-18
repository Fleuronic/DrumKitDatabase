// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Address
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.AddressSpec

extension Database: AddressSpec where AddressSpecifiedFields: Decodable {
	public typealias AddressFetch = SingleResult<AddressSpecifiedFields?>
}
