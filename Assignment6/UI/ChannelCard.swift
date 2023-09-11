//
//  ChannelCard.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/19/23.
//

import SwiftUI

struct ChannelCard: View {
	@EnvironmentObject var model: ViewModel
	let channel : Channel
	
    var body: some View {
		VStack {
			Text(channel.name)
		}
    }
}

#if !Testing
struct ChannelCard_Previews: PreviewProvider {
    static var previews: some View {
		ChannelCard(channel: Channel.examples[0])
			.environmentObject(ViewModel())
    }
}
#endif
