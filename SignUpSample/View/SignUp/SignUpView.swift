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
                instructionText
                switch viewModel.currentStep {
                case .enteringFirstName:
                    firstNameTextField
                    Spacer()
                    nextButton
                case .enteringEmail:
                    emailTextField
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
// MARK: - Input fields
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
        }
        .transition(
            .asymmetric(
                insertion: .opacity.combined(with: .move(edge: .trailing)),
                removal: .opacity.combined(with: .move(edge: .leading))
            )
        )
        .padding(.top)
    }

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
                .accessibilityIdentifier("EmailField")
                .onSubmit(next)
                .focused($focusedField, equals: .email)
                .task {
                    focusedField = .email
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
