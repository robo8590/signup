//
//  SignUpConfirmationView.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/5/21.
//

import SwiftUI

struct SignUpConfirmationView: View {
    /// The view model object
    @ObservedObject var viewModel: SignUpConfirmationViewModel

    var body: some View {
        VStack {
            welcomeText
            messageText
            if !viewModel.account.website.isEmpty {
                websiteLinkButton
            }
            if !viewModel.account.firstName.isEmpty {
                nameText
            }
            emailText
            Spacer()
            loginButton
        }
        .padding()
        .navigationBarHidden(true)
    }
}
// MARK: - Welcome
extension SignUpConfirmationView {
    var welcomeText: some View {
        HStack {
            Text("SignUpConfirmationView.WelcomeLabel \(viewModel.account.firstName)!")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.darkGray)
                .accessibilityIdentifier("SignUpConfirmationView.WelcomeLabel")
            Spacer()
        }
    }
}
// MARK: - Instruction
extension SignUpConfirmationView {
    var messageText: some View {
        Text("SignUpConfirmationView.MessageLabel")
            .foregroundColor(.gray)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("SignUpConfirmationView.MessageLabel")
    }
}
// MARK: - Website
extension SignUpConfirmationView {
    var websiteLinkButton: some View {
        VStack {
            if let url = URL(string: viewModel.account.website) {
                Link(viewModel.account.website, destination: url)
                    .accessibilityIdentifier("SignUpConfirmationView.WebsiteLinkButton")
                    .padding(.top)
            } else {
                EmptyView()
            }
        }
    }
}
// MARK: - Name
extension SignUpConfirmationView {
    var nameText: some View {
        Text(viewModel.account.firstName)
            .foregroundColor(.darkGray)
            .fontWeight(.medium)
            .accessibilityIdentifier("SignUpConfirmationView.NameLabel")
            .padding(.top)
    }
}
// MARK: - Email
extension SignUpConfirmationView {
    var emailText: some View {
        Text(viewModel.account.email)
            .foregroundColor(.darkGray)
            .fontWeight(.medium)
            .accessibilityIdentifier("SignUpConfirmationView.EmailLabel")
            .padding(.top)
    }
}
// MARK: - Buttons
extension SignUpConfirmationView {
    var loginButton: some View {
        Button(action: login) {
            Text("SignUpConfirmationView.LoginButton.Title")
                .fontWeight(.semibold)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(RedButtonStyle())
        .accessibilityIdentifier("SignUpConfirmationView.LoginButton")
    }
}
// MARK: - Actions
extension SignUpConfirmationView {
    func login() {
    }
}
#if DEBUG
struct SignUpConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpConfirmationView(
            viewModel: SignUpConfirmationViewModel(
                Account(
                    firstName: "Nam",
                    email: "robo8590@gmail.com",
                    password: "",
                    website: "https://www.linkedin.com/in/robo8590"
                )
            )
        )
    }
}
#endif
