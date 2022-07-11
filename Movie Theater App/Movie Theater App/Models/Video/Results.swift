/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
	let iso_639_1 : String?
	let iso_3166_1 : String?
	let name : String?
	let key : String?
	let site : String?
	let size : Int?
	let type : String?
	let official : Bool?
	let published_at : String?
	let id : String?

	enum CodingKeys: String, CodingKey {

		case iso_639_1 = "iso_639_1"
		case iso_3166_1 = "iso_3166_1"
		case name = "name"
		case key = "key"
		case site = "site"
		case size = "size"
		case type = "type"
		case official = "official"
		case published_at = "published_at"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		iso_639_1 = try values.decodeIfPresent(String.self, forKey: .iso_639_1)
		iso_3166_1 = try values.decodeIfPresent(String.self, forKey: .iso_3166_1)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		key = try values.decodeIfPresent(String.self, forKey: .key)
		site = try values.decodeIfPresent(String.self, forKey: .site)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		official = try values.decodeIfPresent(Bool.self, forKey: .official)
		published_at = try values.decodeIfPresent(String.self, forKey: .published_at)
		id = try values.decodeIfPresent(String.self, forKey: .id)
	}

}