//
//  US1S16AccountCreatedSuccessfullyTests.swift
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
//  US1-S16 - Scenario 16: The account is created successfully.
//
//  Given I submitted the sign up form
//  and the loading indicator is showing
//  when the app receive successful response
//  then the confirmation view should be showed
//  and the loading indicator is hiding.
//

import XCTest
@testable import SignUpSample

class US1S16AccountCreatedSuccessfullyTests: XCTestCase {
    func testViewModel() async {
        let viewModel = SignUpViewModel()
        let accountService = MockAccountService()
        accountService.signedUpError = nil
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

        XCTAssertEqual(viewModel.currentStep, .submitting)
        XCTAssertNil(viewModel.currentError)
        XCTAssertTrue(viewModel.isCurrentInputValid)
        XCTAssertTrue(viewModel.isGoingToConfirmationView)
        XCTAssertEqual(accountService.signedUpAccount, viewModel.signedUpAccount)
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
        mockServer.serverInfo.accounts = [:]
        accountService.session = mockServer

        // When
        do {
            try await accountService.signUp(account: account)
        } catch {
            XCTFail("No error should be thrown")
        }
    }
}
