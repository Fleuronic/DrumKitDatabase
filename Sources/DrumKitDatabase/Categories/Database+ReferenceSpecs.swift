// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.CorpsEra
import struct DrumKit.DivisionRank
import struct DrumKit.DivisionSubordination
import struct DrumKit.FeatureRole
import struct DrumKit.VenueEra
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol DrumKitService.CorpsEraSpec
import protocol DrumKitService.DivisionRankSpec
import protocol DrumKitService.DivisionSubordinationSpec
import protocol DrumKitService.FeatureRoleSpec
import protocol DrumKitService.VenueEraSpec

extension Database: CorpsEraSpec where CorpsEraSpecifiedFields: Fields<CorpsEra.Identified> & Decodable {
	public typealias CorpsEraList = Results<CorpsEraSpecifiedFields>
}

extension Database: VenueEraSpec where VenueEraSpecifiedFields: Fields<VenueEra.Identified> & Decodable {
	public typealias VenueEraList = Results<VenueEraSpecifiedFields>
}

extension Database: DivisionRankSpec where DivisionRankSpecifiedFields: Fields<DivisionRank.Identified> & Decodable {
	public typealias DivisionRankList = Results<DivisionRankSpecifiedFields>
}

extension Database: DivisionSubordinationSpec where DivisionSubordinationSpecifiedFields: Fields<DivisionSubordination.Identified> & Decodable {
	public typealias DivisionSubordinationList = Results<DivisionSubordinationSpecifiedFields>
}

extension Database: FeatureRoleSpec where FeatureRoleSpecifiedFields: Fields<FeatureRole.Identified> & Decodable {
	public typealias FeatureRoleList = Results<FeatureRoleSpecifiedFields>
}
