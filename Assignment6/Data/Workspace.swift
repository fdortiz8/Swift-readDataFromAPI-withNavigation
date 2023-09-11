//
//  Workspace.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation

struct Workspace: Identifiable, Codable {
	let id: UUID
	let name: String
	let owner: UUID
	let channels: Int
}

extension Workspace {
	static let examples = [
		Workspace(id: UUID(), name: "Fernnnnanndo", owner: UUID(), channels: 42)
	]
}
