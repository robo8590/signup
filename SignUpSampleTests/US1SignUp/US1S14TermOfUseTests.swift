//
//  US1S14TermOfUseTests.swift
//  SignUpSampleTests
//
//  Created by Nam Tran on 12/5/21.
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Viewing term of use
//
//  US1-S14 - Scenario 14: Term of use.
//
//  Given I started the sign up wizard
//  when I go to the last step
//  then I am able to view the term of use
//  and the submit button is enable.
//

import XCTest
@testable import SignUpSample

class US1S14TermOfUseTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam"
        viewModel.email = "robo8590@gmail.com"
        viewModel.password = "Nam12!"
        viewModel.website = "http://www.linkedin.com/in/robo8590"
        viewModel.currentStep = .enteringWebsite

        // When
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .viewingTermOfUse)
        XCTAssertTrue(viewModel.isCurrentInputValid)
    }
}
