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
            .padding(.horizontal)
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
    }
}
// MARK: - Input fields
extension SignUpView {
    var firstNameTextField: some View {
        ZStack(alignment: .leading) {
            Text("SignUpView.FirstNameTextField.Title")
                .fontWeight(.medium)
                .foregroundColor(.darkGray)
                .padding()
            TextField("", text: $viewModel.firstName)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .onSubmit(viewModel.next)
                .focused($focusedField, equals: .firstName)
                .task {
                    await Task.sleep(100_000_000)
                    focusedField = .firstName
                }
        }
        .padding(.top)
    }

    var emailTextField: some View {
        ZStack(alignment: .leading) {
            Text("SignUpView.EmailTextField.Title")
                .fontWeight(.medium)
                .foregroundColor(.darkGray)
                .padding()
            TextField("", text: $viewModel.email)
                .textFieldStyle(RoundedTextFieldStyle())
                .submitLabel(.next)
                .onSubmit(viewModel.next)
                .focused($focusedField, equals: .email)
                .task {
                    focusedField = .email
                }
        }
        .padding(.top)
    }
}
// MARK: - Buttons
extension SignUpView {
    var nextButton: some View {
        HStack {
            Spacer()
            Button(action: viewModel.next) {
                Text("SignUpView.NextButton.Title")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            .disabled(!viewModel.isCurrentInputValid)
            .buttonStyle(RedButtonStyle())
            .padding(.bottom)
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
