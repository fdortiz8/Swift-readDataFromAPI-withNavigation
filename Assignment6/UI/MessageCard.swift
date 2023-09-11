//
//  MessageCard.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/19/23.
//

import SwiftUI

struct MessageCard: View {
	@EnvironmentObject var model: ViewModel
	let message: Message
	
    var body: some View {
		VStack {
			Text(message.content)
		}
    }
}

#if !Testing
struct MessageCard_Previews: PreviewProvider {
    static var previews: some View {
		MessageCard(message: Message.examples[0])
			.environmentObject(ViewModel())
    }
}
#endif
