//
//  US1S6EmailLimits200CharsTests.swift
//  SignUpSampleTests
//
//  Created by Nam Tran on 12/5/21.
//
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Entering the email
//
//  US1-S6 - Scenario 6: The email limits 200 characters.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  when I enter more than 200 characters
//  then the email field only accepts 200 characters.
//

import XCTest
@testable import SignUpSample

class US1S6EmailLimits200CharsTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam Tran"
        viewModel.currentStep = .enteringEmail
        XCTAssertEqual(viewModel.email, "")
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        let input = "robo8590robo8590robo8590robo8590robo8590robo8590robo8590robo8590"
        + "robo8590robo8590robo8590robo8590robo8590robo8590robo8590robo8590robo8590"
        + "@gmailgmailgmailgmailgmailgmailgmailgmailgmailgmail.commmmmmmmmmmmmmmmm"
        viewModel.email = input
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertEqual(viewModel.email, String(input.prefix(200)))
        XCTAssertEqual(viewModel.isCurrentInputValid, true)
    }
}
