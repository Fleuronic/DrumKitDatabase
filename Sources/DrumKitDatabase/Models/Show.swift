
import PersistDB
import struct DrumKit.Show

extension Show.Identified {
	static func predicate(name: String) -> Predicate<Self> {
		\.value.name == name
	}
}
