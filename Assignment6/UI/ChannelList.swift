//
//  ChannelList.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/19/23.
//

import SwiftUI

struct ChannelList: View {
	@EnvironmentObject var model: ViewModel
	@State private var channel: Channel?
	@State private var selectedChannelName : String?
	
	var body: some View {
		NavigationStack {
			VStack() {
				if model.channels.isEmpty {
					ProgressView()
				} else {
					List {
						ForEach(model.channels) { channel in
							NavigationLink(destination: MessageList()) {
								ChannelCard(channel: channel)
									.onTapGesture {
										selectedChannelName = channel.name
										model.channel = channel
									}
							}
							
						}
					}
					.refreshable {
						model.getChannels()
					}
				}
			}
			.navigationTitle(selectedChannelName ?? "")
			.onAppear {
				model.getChannels()
			}
		}
	}
}
//
//#if !Testing
//struct ChannelList_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelList()
//			.environmentObject(ViewModel())
//    }
//}
//#endif
