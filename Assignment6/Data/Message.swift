//
//  Message.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation

struct Message : Identifiable, Codable {
	let id: UUID
	let member: UUID
	let posted: Date
	let content: String
	
	}

extension Message {
	static let examples = [
		Message(id: UUID(), member: UUID(), posted: Date(), content: "this is content")
	]
}
