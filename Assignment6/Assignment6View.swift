
import SwiftUI

struct Assignment6View: View {
	@EnvironmentObject var model: ViewModel
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var loginSuccess = false
	
	private func login() {
		model.login(email: email, password: password)
		loginSuccess = true
	}
	
	var body: some View {
		
		ScrollView {
			
			LazyVStack {
				Text("CSE118 Assignment 6")
				
				Image("SlugLogo")
				
				TextField("email", text: $email)
					.textInputAutocapitalization(.never)
					.autocorrectionDisabled(true)
					.textFieldStyle(.roundedBorder)
				
				SecureField("Password", text: $password)
					.textInputAutocapitalization(.never)
					.autocorrectionDisabled(true)
					.textFieldStyle(.roundedBorder)
				
				Button("Login", action: login)
					.disabled(loginSuccess)
			}
			.padding()
		}
		.navigationTitle("Login")
		.navigationBarBackButtonHidden(false)
		.fullScreenCover(isPresented: $loginSuccess, content: {
			WorkspaceList()
		})
	}
}
