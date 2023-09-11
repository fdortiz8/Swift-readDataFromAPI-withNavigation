//
//  LoginResponse.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation

struct LoginResponse: Decodable {
	let id: String
	let name: String
	let role: String
	let accessToken: String
}

