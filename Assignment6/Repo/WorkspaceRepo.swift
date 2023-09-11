//
//  WorkspaceRepo.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation

struct WorkspaceRepo {
	static func getWorkspaces(accessToken: String) async throws -> [Workspace] {
		let url = URL(string: "https://cse118.com/api/v2/workspace")!
		var request = URLRequest(url: url)
		request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
		
		let (data, _) = try await URLSession.shared.data(for: request)
		return try JSONDecoder().decode([Workspace].self, from: data)
	}
}
