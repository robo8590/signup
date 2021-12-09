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
                if viewModel.currentStep != .submitting {
                    titleText
                }
                if viewModel.currentStep != .viewingTermOfUse && viewModel.currentStep != .submitting {
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
                case .submitting:
                    progressView
                }
                if viewModel.currentStep == .viewingTermOfUse {
                    submitButton
                } else if viewModel.currentStep != .submitting {
                    if viewModel.currentError != nil {
                        errorText
                    }
                    Spacer()
                    nextButton
                }
                NavigationLink(
                    destination: SignUpConfirmationView(
                        viewModel: SignUpConfirmationViewModel(viewModel.signedUpAccount)
                    ),
                    isActive: $viewModel.isGoingToConfirmationView
                ) {
                    EmptyView()
                }
                .hidden()
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
                .accessibilityIdentifier("SignUpView.TitleLabel")
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
            .accessibilityIdentifier("SignUpView.InstructionLabel")
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
                    .accessibilityIdentifier("SignUpView.FirstNameLabel")
            }
            TextField("", text: $viewModel.firstName)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .accessibilityIdentifier("SignUpView.FirstNameField")
                .onSubmit(next)
                .focused($focusedField, equals: .firstName)
                .task {
                    await Task.sleep(500_000_000)
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
                    .accessibilityIdentifier("SignUpView.EmailLabel")
            }
            TextField("", text: $viewModel.email)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .keyboardType(.emailAddress)
                .accessibilityIdentifier("SignUpView.EmailField")
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
                    .accessibilityIdentifier("SignUpView.PasswordLabel")
            }
            SecureField("", text: $viewModel.password)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .accessibilityIdentifier("SignUpView.PasswordField")
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
                    .accessibilityIdentifier("SignUpView.WebsiteLabel")
            }
            TextField("", text: $viewModel.website)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .accessibilityIdentifier("SignUpView.WebsiteField")
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
                .accessibilityIdentifier("SignUpView.TermOfUseTitleLabel")
            ScrollView {
                VStack {
                    Text("SignUpView.TermOfUse")
                        .lineLimit(nil)
                        .accessibilityIdentifier("SignUpView.TermOfUseView")
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
            .accessibilityIdentifier("SignUpView.ErrorLabel")
    }

    var errorStringKey: String {
        switch viewModel.currentError {
        case .emailIsInvalid:
            return "SignUpView.EmailIsInvalid"
        case .passwordIsInvalid:
            return "SignUpView.PasswordIsInvalid"
        case .websiteIsInvalid:
            return "SignUpView.WebsiteIsInvalid"
        case .emailIsAlreadyInUse:
            return "SignUpView.EmailIsAlreadyInUse"
        case .unknown:
            return "SignUpView.UnknownError"
        default:
            return ""
        }
    }
}
// MARK: - Progress view
extension SignUpView {
    var progressView: some View {
        ProgressView()
            .accessibilityIdentifier("SignUpView.ProgressView")
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
            .accessibilityIdentifier("SignUpView.NextButton")
        }
    }

    var submitButton: some View {
        HStack {
            Spacer()
            Button(action: submit) {
                Text("SignUpView.SubmitButton.Title")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            .buttonStyle(RedButtonStyle())
            .accessibilityIdentifier("SignUpView.SubmitButton")
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

    func submit() {
        Task {
            await viewModel.submit()
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
