//
//  SignUpView.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/5/21.
//

import SwiftUI

// MARK: - Field
enum SignUpField: Hashable {
    case firstName
    case email
    case password
    case website
}
// MARK: - Layout
/// The sign up view object
struct SignUpView: View {
    /// The view model object
    @ObservedObject var viewModel: SignUpViewModel

    /// The focused field
    @FocusState private var focusedField: SignUpField?

    var body: some View {
        NavigationView {
            VStack {
                titleText
                if viewModel.currentStep != .viewingTermOfUse {
                    instructionText
                }
                switch viewModel.currentStep {
                case .enteringFirstName:
                    firstNameTextField
                case .enteringEmail:
                    emailTextField
                case .enteringPassword:
                    passwordTextField
                case .enteringWebsite:
                    websiteField
                case .viewingTermOfUse:
                    termOfUseView
                }
                if viewModel.currentStep == .viewingTermOfUse {
                    submitButton
                } else {
                    if viewModel.currentError != nil {
                        errorText
                    }
                    Spacer()
                    nextButton
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
// MARK: - Title
extension SignUpView {
    var titleText: some View {
        HStack {
            Text("SignUpView.Title")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.darkGray)
                .accessibilityIdentifier("TitleLabel")
            Spacer()
        }
    }
}
// MARK: - Instruction
extension SignUpView {
    var instructionText: some View {
        Text("SignUpView.Instruction")
            .foregroundColor(.gray)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("InstructionLabel")
    }
}
// MARK: - First Name Field
extension SignUpView {
    var firstNameTextField: some View {
        ZStack(alignment: .leading) {
            if viewModel.firstName.isEmpty {
                Text("SignUpView.FirstNameTextField.Title")
                    .fontWeight(.medium)
                    .foregroundColor(.darkGray)
                    .padding()
                    .accessibilityIdentifier("FirstNameLabel")
            }
            TextField("", text: $viewModel.firstName)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .accessibilityIdentifier("FirstNameField")
                .onSubmit(next)
                .focused($focusedField, equals: .firstName)
                .task {
                    await Task.sleep(100_000_000)
                    focusedField = .firstName
                }
                .onChange(of: viewModel.firstName) { _ in
                    viewModel.trimFirstNameIfNeeded()
                }
        }
        .transition(
            .asymmetric(
                insertion: .opacity.combined(with: .move(edge: .trailing)),
                removal: .opacity.combined(with: .move(edge: .leading))
            )
        )
        .padding(.top)
    }
}
// MARK: - Email Field
extension SignUpView {
    var emailTextField: some View {
        ZStack(alignment: .leading) {
            if viewModel.email.isEmpty {
                Text("SignUpView.EmailTextField.Title")
                    .fontWeight(.medium)
                    .foregroundColor(.darkGray)
                    .padding()
                    .accessibilityIdentifier("EmailLabel")
            }
            TextField("", text: $viewModel.email)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .keyboardType(.emailAddress)
                .accessibilityIdentifier("EmailField")
                .onSubmit(next)
                .focused($focusedField, equals: .email)
                .task {
                    focusedField = .email
                }
                .onChange(of: viewModel.email) { _ in
                    viewModel.handleEmailOnChange()
                }
        }
        .transition(
            .asymmetric(
                insertion: .opacity.combined(with: .move(edge: .trailing)),
                removal: .opacity.combined(with: .move(edge: .leading))
            )
        )
        .padding(.top)
    }
}
// MARK: - Password Field
extension SignUpView {
    var passwordTextField: some View {
        ZStack(alignment: .leading) {
            if viewModel.password.isEmpty {
                Text("SignUpView.PasswordField.Title")
                    .fontWeight(.medium)
                    .foregroundColor(.darkGray)
                    .padding()
                    .accessibilityIdentifier("PasswordLabel")
            }
            SecureField("", text: $viewModel.password)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .accessibilityIdentifier("PasswordField")
                .onSubmit(next)
                .focused($focusedField, equals: .password)
                .task {
                    focusedField = .password
                }
                .onChange(of: viewModel.password) { _ in
                    viewModel.handlePasswordOnChange()
                }
        }
        .transition(
            .asymmetric(
                insertion: .opacity.combined(with: .move(edge: .trailing)),
                removal: .opacity.combined(with: .move(edge: .leading))
            )
        )
        .padding(.top)
    }
}
// MARK: - Website Field
extension SignUpView {
    var websiteField: some View {
        ZStack(alignment: .leading) {
            if viewModel.website.isEmpty {
                Text("SignUpView.WebsiteField.Title")
                    .fontWeight(.medium)
                    .foregroundColor(.darkGray)
                    .padding()
                    .accessibilityIdentifier("WebsiteLabel")
            }
            TextField("", text: $viewModel.website)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .accessibilityIdentifier("WebsiteField")
                .onSubmit(next)
                .focused($focusedField, equals: .website)
                .task {
                    focusedField = .website
                }
                .onChange(of: viewModel.website) { _ in
                    viewModel.handleWebsiteOnChange()
                }
        }
        .transition(
            .asymmetric(
                insertion: .opacity.combined(with: .move(edge: .trailing)),
                removal: .opacity.combined(with: .move(edge: .leading))
            )
        )
        .padding(.top)
    }
}
// MARK: - Term Of Use View
extension SignUpView {
    var termOfUseView: some View {
        VStack {
            Text("SignUpView.TermOfUse.Title")
                .foregroundColor(.darkGray)
                .fontWeight(.semibold)
                .accessibilityIdentifier("TermOfUseTitleLabel")
            ScrollView {
                VStack {
                    Text("SignUpView.TermOfUse")
                        .lineLimit(nil)
                        .accessibilityIdentifier("TermOfUseView")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.top, 1)
    }
}
// MARK: - Error Message
extension SignUpView {
    var errorText: some View {
        return Text(LocalizedStringKey(errorStringKey))
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityIdentifier("ErrorLabel")
    }

    var errorStringKey: String {
        switch viewModel.currentError {
        case .emailIsInvalid:
            return "SignUpView.EmailIsInvalid"
        case .passwordIsInvalid:
            return "SignUpView.PasswordIsInvalid"
        default:
            return ""
        }
    }
}
// MARK: - Buttons
extension SignUpView {
    var nextButton: some View {
        HStack {
            Spacer()
            Button(action: next) {
                Text("SignUpView.NextButton.Title")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            .disabled(!viewModel.isCurrentInputValid)
            .buttonStyle(RedButtonStyle())
            .accessibilityIdentifier("NextButton")
        }
    }

    var submitButton: some View {
        HStack {
            Spacer()
            Button(action: viewModel.submit) {
                Text("SignUpView.SubmitButton.Title")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            .buttonStyle(RedButtonStyle())
            .accessibilityIdentifier("SubmitButton")
        }
    }
}
// MARK: - Actions
extension SignUpView {
    func next() {
        withAnimation {
            viewModel.next()
        }
    }
}
// MARK: - Preview
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
        SignUpView(viewModel: SignUpViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
        SignUpView(viewModel: SignUpViewModel())
            .environment(\.locale, .init(identifier: "vi"))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
        SignUpView(viewModel: SignUpViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .preferredColorScheme(.dark)
        SignUpView(viewModel: SignUpViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPad (9th generation)"))
    }
}
#endif
