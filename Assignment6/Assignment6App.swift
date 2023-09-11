
import SwiftUI

@main
struct Assignment6App: App {
	var body: some Scene {
		WindowGroup {
			NavigationStack {
				Assignment6View()
					.environmentObject(ViewModel())
			}
		}
	}
}
