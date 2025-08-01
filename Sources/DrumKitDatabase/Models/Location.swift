
import PersistDB
import struct DrumKit.Location

extension Location.Identified {
	static func predicate(
		city: String, 
		state: String
	) -> Predicate<Self> {
		\.value.city == city && \.state.value.abbreviation == state
	}
}
