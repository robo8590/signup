//
//  US1S15EmailIsAlreadyInUseTests.swift
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
//  Submitting
//
//  US1-S15 - Scenario 15: The email is already in use.
//
//  Given I submitted the sign up form
//  and the loading indicator is showing
//  when the app receive error about "The email is already in use"
//  then the email field is showed
//  and the error message "The email is already in use" is showed
//  and the loading indicator is hiding.
//

import XCTest
@testable import SignUpSample

class US1S15EmailIsAlreadyInUseTests: XCTestCase {
    func testViewModel() async {
        let viewModel = SignUpViewModel()
        let accountService = MockAccountService()
        accountService.signedUpError = .emailIsAlreadyInUse
        viewModel.accountService = accountService

        // Given
        viewModel.firstName = "Nam"
        viewModel.email = "robo8590@gmail.com"
        viewModel.password = "Nam12!"
        viewModel.website = "http://www.linkedin.com/in/robo8590"
        viewModel.currentStep = .viewingTermOfUse

        // When
        await viewModel.submit()

        // Then
        XCTAssertEqual(accountService.signedUpAccount?.firstName, "Nam")
        XCTAssertEqual(accountService.signedUpAccount?.email, "robo8590@gmail.com")
        XCTAssertEqual(accountService.signedUpAccount?.password, "Nam12!")
        XCTAssertEqual(accountService.signedUpAccount?.website, "http://www.linkedin.com/in/robo8590")

        XCTAssertEqual(viewModel.currentStep, .enteringEmail)
        XCTAssertEqual(viewModel.currentError, .emailIsAlreadyInUse)
        XCTAssertTrue(viewModel.isCurrentInputValid)
    }

    func testSignUpFuncOfAccountService() async {
        // Given
        let firstName = "Nam Tran"
        let email = "robo8590@gmail.com"
        let password = "Nam12!"
        let website = "http://www.linkedin.com/in/robo8590"
        let account = Account(firstName: firstName, email: email, password: password, website: website)

        var accountService = AccountService()
        let mockServer = MockServer()
        mockServer.serverInfo.delayTime = 0
        accountService.session = mockServer

        // When
        do {
            try await accountService.signUp(account: account)
            XCTFail("The error email is already in use needed to be thrown")
        } catch SignUpError.emailIsAlreadyInUse {
        } catch {
            XCTFail("The error email is already in use needed to be thrown")
        }
    }
}
