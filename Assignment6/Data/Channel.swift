//
//  Channel.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation

struct Channel: Identifiable, Codable {
	let id: UUID
	let name: String
	let messages: Int
}

extension Channel {
	static let examples = [
		Channel(id: UUID(), name: "Fernando Channel ex.", messages: 43)
	]
}
