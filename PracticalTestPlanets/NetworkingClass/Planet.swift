

import Foundation
struct Planet : Codable {
    
    // MARK: Properties
	let count : Int?
	let next : String?
	let previous : String?
	let results : [Results]?

    // MARK: Enums
    // Enum to define all attributes here you want to include in parsing
    
	enum CodingKeys: String, CodingKey {
		case count = "count"
		case next = "next"
		case previous = "previous"
		case results = "results"
	}

    // MARK: Decoder methods
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		next = try values.decodeIfPresent(String.self, forKey: .next)
		previous = try values.decodeIfPresent(String.self, forKey: .previous)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
