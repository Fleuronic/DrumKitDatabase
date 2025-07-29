// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Identity
import Foundation
import struct DrumKit.ZIPCode
import struct DrumKitService.IdentifiedZIPCode
import struct Catena.IDFields
import protocol Catenoid.Row

public struct ZIPCodeRow {
	public let id: ZIPCode.ID

	private let code: String
}

// MARK: -
public extension ZIPCodeRow {
	init(
		id: ZIPCode.ID?,
		code: String?
	) {
		self.id = id ?? .null
		self.code = code ?? ""
	}
}

// MARK: -
extension ZIPCodeRow: Row {
	// MARK: Valued
	public typealias Value = ZIPCode

	// MARK: Representable
	public var value: Value {
		.init(code: code)
	}

	// MARK: Model
	public var identifiedModelID: ZIPCode.ID? { id }

	public var valueSet: ValueSet<ZIPCode.Identified> {
		[\.value.code == code]
	}
}
