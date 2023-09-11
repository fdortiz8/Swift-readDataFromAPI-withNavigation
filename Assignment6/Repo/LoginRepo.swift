//
//  LoginRepo.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation

struct LoginRepo {
	static func login(credentials: LoginCredentials) async throws -> LoginResponse {
		print(credentials)
		let url = URL(string: "https://cse118.com/api/v2/login")!
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = try JSONEncoder().encode(credentials)
		
		let (data, _ ) = try await URLSession.shared.data(for: request)
		let jsonString = String(decoding: data, as: UTF8.self)
		print(jsonString)
		return try JSONDecoder().decode(LoginResponse.self, from: data)
	}
}
