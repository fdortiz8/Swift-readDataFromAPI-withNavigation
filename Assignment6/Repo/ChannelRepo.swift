//
//  ChannelRepo.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/19/23.
//

import Foundation

struct ChannelRepo {
	let workspace: Workspace
	static func getChannels(accessToken: String, workspace: Workspace) async throws -> [Channel] {
		let url = URL(string: "https://cse118.com/api/v2/workspace/\(workspace.id)/channel")!
		var request = URLRequest(url: url)
		request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
		
		let (data, _) = try await URLSession.shared.data(for: request)
		return try JSONDecoder().decode([Channel].self, from: data)
	}
}
