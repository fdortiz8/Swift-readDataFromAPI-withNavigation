//
//  MessageRepo.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/19/23.
//

import Foundation

struct MessageRepo {
	let channel : Channel
	static func getMessages(accessToken: String, channel: Channel) async throws -> [Message] {
		let url = URL(string: "https://cse118.com/api/v2/channel/\(channel.id)/message")!
		var request = URLRequest(url: url)
		request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
		
		let (data, _) = try await URLSession.shared.data(for: request)
		return try JSONDecoder().decode([Message].self, from: data)
		
	}
}
