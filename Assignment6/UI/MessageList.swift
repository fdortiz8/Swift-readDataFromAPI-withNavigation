//
//  MessageList.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/19/23.
//

import SwiftUI

struct MessageList: View {
	@EnvironmentObject var model: ViewModel
	@State private var message: Message?
	@State private var selectedMessageName: String?
	
	var body: some View {
		NavigationStack {
			VStack() {
				if model.messages.isEmpty {
					ProgressView()
				} else {
					List {
						ForEach(model.messages) {message in
							NavigationLink(destination: MessageList()) {
								MessageCard(message: message)
									.onTapGesture {
										model.message = message
									}
							}
						}
					}
					.refreshable {
						model.getMessages()
					}
				}
			}
			.navigationTitle("Messages")
			.onAppear {
				model.getMessages()
			}
		}
	}
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
