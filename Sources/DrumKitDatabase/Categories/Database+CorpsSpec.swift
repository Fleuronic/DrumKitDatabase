// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Corps
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.CorpsSpec

extension Database: CorpsSpec where CorpsSpecifiedFields: Decodable {
	public typealias CorpsList = Results<CorpsSpecifiedFields>
	public typealias CorpsFetch = SingleResult<CorpsSpecifiedFields?>
}
