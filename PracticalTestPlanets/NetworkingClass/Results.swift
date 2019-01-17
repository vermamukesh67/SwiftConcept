/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
    
    // MARK: Properties
    
	let name : String?
	let rotation_period : String?
	let orbital_period : String?
	let diameter : String?
	let climate : String?
	let gravity : String?
	let terrain : String?
	let surface_water : String?
	let population : String?
	let residents : [String]?
	let films : [String]?
	let created : String?
	let edited : String?
	let url : String?

    // MARK: Enums
    // Enum to define all attributes here you want to include in parsing
    
	enum CodingKeys: String, CodingKey {

		case name = "name"
		case rotation_period = "rotation_period"
		case orbital_period = "orbital_period"
		case diameter = "diameter"
		case climate = "climate"
		case gravity = "gravity"
		case terrain = "terrain"
		case surface_water = "surface_water"
		case population = "population"
		case residents = "residents"
		case films = "films"
		case created = "created"
		case edited = "edited"
		case url = "url"
	}

    // MARK: Decoder methods
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		rotation_period = try values.decodeIfPresent(String.self, forKey: .rotation_period)
		orbital_period = try values.decodeIfPresent(String.self, forKey: .orbital_period)
		diameter = try values.decodeIfPresent(String.self, forKey: .diameter)
		climate = try values.decodeIfPresent(String.self, forKey: .climate)
		gravity = try values.decodeIfPresent(String.self, forKey: .gravity)
		terrain = try values.decodeIfPresent(String.self, forKey: .terrain)
		surface_water = try values.decodeIfPresent(String.self, forKey: .surface_water)
		population = try values.decodeIfPresent(String.self, forKey: .population)
		residents = try values.decodeIfPresent([String].self, forKey: .residents)
		films = try values.decodeIfPresent([String].self, forKey: .films)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		edited = try values.decodeIfPresent(String.self, forKey: .edited)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
