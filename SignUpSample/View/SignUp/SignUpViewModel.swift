//
//  SignUpViewModel.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/5/21.
//

import Foundation

// MARK: - Define the steps
/// The step of sign up process
enum SignUpStep {
    case enteringFirstName
    case enteringEmail
}

// MARK: - Define the states
/// The view model of sign up view
class SignUpViewModel: ObservableObject {
    /// The current step of sign up process
    @Published var currentStep: SignUpStep = .enteringFirstName
    /// The state of the next button
    @Published var isNextButtonEnabled = true
    /// The first name of the user
    @Published var firstName: String = ""
    /// The email of the user
    @Published var email: String = ""
}

// MARK: - Input Validation
extension SignUpViewModel {
    /// Checks the current input is valid or not
    var isCurrentInputValid: Bool {
        switch currentStep {
        case .enteringFirstName:
            return isFirstNameValid
        case .enteringEmail:
            return isEmailValid
        }
    }

    /// Checks the first name is valid
    var isFirstNameValid: Bool {
        guard !firstName.isEmpty else {
            return true
        }
        return true
    }

    /// Checks the email is valid or not
    var isEmailValid: Bool {
        guard !email.isEmpty else {
            return false
        }
        return true
    }
}

// MARK: - Actions
extension SignUpViewModel {
    /// Go to the next step of sign up process
    func next() {
        guard isNextButtonEnabled else {
            return
        }
        switch currentStep {
        case .enteringFirstName:
            currentStep = .enteringEmail
        case .enteringEmail:
            break
        }
        isNextButtonEnabled = isCurrentInputValid
    }
}
