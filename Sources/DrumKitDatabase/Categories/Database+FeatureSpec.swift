// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct DrumKit.Feature
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.FeatureSpec

extension Database: FeatureSpec where FeatureSpecifiedFields: Decodable {
	public typealias FeatureFetch = SingleResult<FeatureSpecifiedFields?>
}
