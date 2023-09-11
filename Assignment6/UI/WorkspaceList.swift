	//
	//  WorkspaceList.swift
	//  Assignment6
	//
	//  Created by Fernando Ortiz on 7/14/23.
	//

import SwiftUI

struct WorkspaceList: View {
	@EnvironmentObject var model: ViewModel
	@State var workspace = [Workspace]()
	@State private var selectedWorkspaceName: String?
	
	var body: some View {
		//NavigationStack {
			VStack() {
				if model.workspaces.isEmpty {
					ProgressView()
				} else {
					List {
						ForEach(model.workspaces) {workspace in
							NavigationLink(destination: ChannelList()) {
								WorkspaceCard(workspace: workspace).onTapGesture {
										selectedWorkspaceName = workspace.name
										model.workspace = workspace
									}
							}
						}
					}
					.refreshable {
						model.getWorkspaces()
					}
				}
			}
			.navigationTitle(selectedWorkspaceName ?? "")
			.onAppear {
				model.getWorkspaces()
			}
		
	}
}

#if !Testing
struct WorkspaceList_Previews: PreviewProvider {
	static var previews: some View {
		WorkspaceList()
			.environmentObject(ViewModel())
	}
}
#endif
