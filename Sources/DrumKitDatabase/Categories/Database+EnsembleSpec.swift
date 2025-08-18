// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Ensemble
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.EnsembleSpec

extension Database: EnsembleSpec where EnsembleSpecifiedFields: Decodable {
	public typealias EnsembleFetch = SingleResult<EnsembleSpecifiedFields?>
}
