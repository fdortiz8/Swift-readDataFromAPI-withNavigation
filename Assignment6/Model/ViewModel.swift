//
//  ViewModel.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import Foundation
class ViewModel: ObservableObject {
	@Published var loginResponse: LoginResponse?
	@Published var workspaces = [Workspace]()
	@Published var workspace: Workspace?
	@Published var channels = [Channel]()
	@Published var channel: Channel?
	@Published var messages = [Message]()
	@Published var message: Message?
	
	func login(email: String, password: String) {
		let credentials = LoginCredentials(email: email, password: password)
		Task{
			do {
				let loginResponse = try await LoginRepo.login(credentials: credentials)
				DispatchQueue.main.async {
					self.loginResponse = loginResponse
					self.getWorkspaces()
				}
					//print("Inside viewModel loginResponse is: \(loginResponse.accessToken)")
			} catch {
				print("Login failed: \(error)")
			}
		}
	}
	
	func getWorkspaces() {
		guard let accessToken = loginResponse?.accessToken else {
			print("No access token")
			return
		}
		Task {
			do {
				let workspaces = try await WorkspaceRepo.getWorkspaces(accessToken: accessToken)
				DispatchQueue.main.async {
					self.workspaces = workspaces
						//print("workspaces are: \(self.workspaces)")
				}
			} catch {
				print("Error getting workspaces: \(error)")
			}
		}
	}
	
	
	func getChannels() {
		guard let accessToken = loginResponse?.accessToken, let workspace = workspace else {
			print("No access token or no workspace")
				//print("\(workspace!.name)")
			return
		}
		Task {
			do {
				let channels = try await ChannelRepo.getChannels(accessToken: accessToken, workspace: workspace)
				DispatchQueue.main.async {
					self.channels = channels
					print("Channels are: \(self.channels)")
				}
			} catch {
				print("Error getting channels: \(error)")
			}
		}
	}
	
	func getMessages() {
		guard let accessToken = loginResponse?.accessToken, let channel = channel else {
			print("No access token or no channel")
			return
		}
		Task {
			do {
				let messages = try await MessageRepo.getMessages(accessToken: accessToken, channel: channel)
				DispatchQueue.main.async {
					self.messages = messages
				}
			} catch {
				print("Error getting channels: \(error)")
			}
		}
	}
}
