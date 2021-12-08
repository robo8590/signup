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
    case enteringPassword
    case enteringWebsite
    case viewingTermOfUse
}

// MARK: - Define the errors
enum SignUpError: Error {
    case firstNameIsInvalid
    case emailIsInvalid
    case passwordIsInvalid
    case websiteIsInvalid
    case emailIsAlreadyInUse
    case internalServerError
    case deviceIsOffline
}

// MARK: - Define the states
/// The view model of sign up view
class SignUpViewModel: ObservableObject {
    /// The current step of sign up process
    @Published var currentStep: SignUpStep = .enteringFirstName
    /// The first name of the user
    @Published var firstName: String = ""
    /// The email of the user
    @Published var email: String = ""
    /// The password of the user
    @Published var password: String = ""
    /// The website of the user
    @Published var website: String = ""
    /// The current error of process
    @Published var currentError: SignUpError?
}

// MARK: - Input Validation
extension SignUpViewModel {
    /// The maximum character
    static let maxChars = 200

    /// The regular expression for email
    static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    /// The regular expression for password
    static let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{6,200}$"

    /// Checks the current input is valid or not
    var isCurrentInputValid: Bool {
        switch currentStep {
        case .enteringFirstName:
            return isFirstNameValid
        case .enteringEmail:
            return isEmailValid
        case .enteringPassword:
            return isPasswordValid
        case .enteringWebsite:
            return isWebsiteValid
        case .viewingTermOfUse:
            return true
        }
    }

    /// Checks the first name is valid
    var isFirstNameValid: Bool {
        guard !firstName.isEmpty else {
            return true
        }
        return firstName.count <= SignUpViewModel.maxChars
    }

    /// Checks the email is valid or not
    var isEmailValid: Bool {
        guard !email.isEmpty else {
            return false
        }
        guard email.count <= SignUpViewModel.maxChars else {
            return false
        }
        let predicate = NSPredicate(format: "SELF MATCHES %@", SignUpViewModel.emailRegex)
        return predicate.evaluate(with: email)
    }

    /// Checks the password is valid or not
    var isPasswordValid: Bool {
        guard !password.isEmpty else {
            return false
        }
        let predicate = NSPredicate(format: "SELF MATCHES %@", SignUpViewModel.passwordRegex)
        return predicate.evaluate(with: password)
    }

    /// Checks the website is valid or not
    var isWebsiteValid: Bool {
        guard !website.isEmpty else {
            return true
        }
        return true
    }

    /// Trim the first name if it exceed the maximum characters
    func trimFirstNameIfNeeded() {
        if firstName.count > SignUpViewModel.maxChars {
            firstName = String(firstName.prefix(SignUpViewModel.maxChars))
        }
    }

    /// Trim the email if it exceed the maximum characters
    func trimEmailIfNeeded() {
        if email.count > SignUpViewModel.maxChars {
            email = String(email.prefix(SignUpViewModel.maxChars))
        }
    }

    /// Trim the password if it exceed the maximum characters
    func trimPasswordIfNeeded() {
        if password.count > SignUpViewModel.maxChars {
            password = String(password.prefix(SignUpViewModel.maxChars))
        }
    }

    /// Trim the website if it exceed the maximum characters
    func trimWebsiteIfNeeded() {
        if website.count > SignUpViewModel.maxChars {
            website = String(website.prefix(SignUpViewModel.maxChars))
        }
    }
}

// MARK: - Actions
extension SignUpViewModel {
    /// Go to the next step of sign up process
    func next() {
        guard isCurrentInputValid else {
            return
        }
        switch currentStep {
        case .enteringFirstName:
            currentStep = .enteringEmail
        case .enteringEmail:
            currentStep = .enteringPassword
        case .enteringPassword:
            currentStep = .enteringWebsite
        case .enteringWebsite:
            currentStep = .viewingTermOfUse
        case .viewingTermOfUse:
            break
        }
    }

    /// Handle event the user is entering the email
    func handleEmailOnChange() {
        trimEmailIfNeeded()
        currentError = isEmailValid ? nil : .emailIsInvalid
    }

    /// Handle event the user is entering the password
    func handlePasswordOnChange() {
        trimPasswordIfNeeded()
        currentError = isPasswordValid ? nil : .passwordIsInvalid
    }

    /// Handle event the user is entering the password
    func handleWebsiteOnChange() {
        trimWebsiteIfNeeded()
    }

    /// Submit the form to server
    func submit() {
    }
}
