// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Ensemble
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.EnsembleSpec

extension Database: EnsembleSpec where EnsembleSpecifiedFields: Fields<Ensemble.Identified> & Decodable {
	public typealias EnsembleFetch = SingleResult<EnsembleSpecifiedFields?>
}
