//
//  WorkspaceCard.swift
//  Assignment6
//
//  Created by Fernando Ortiz on 7/14/23.
//

import SwiftUI

struct WorkspaceCard: View {
	//@EnvironmentObject var model: ViewModel
	var workspace : Workspace
	
	var body: some View {
		VStack {
			Text(workspace.name)
		}
	}
}

#if !Testing
struct WorkspaceCard_Previews: PreviewProvider {
    static var previews: some View {
		WorkspaceCard(workspace: Workspace.examples[0])
			.environmentObject(ViewModel())
    }
}
#endif
