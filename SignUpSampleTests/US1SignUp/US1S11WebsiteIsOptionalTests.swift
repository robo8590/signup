//
//  US1S11WebsiteIsOptionalTests.swift
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
//  Entering the website
//
//  US1-S11 - Scenario 11: The website is optional.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the website
//  and the website field was focused on
//  and the keyboard was presented
//  when I don't want to enter the website
//  and I tap to the next button
//  then the term of use should be showed.
//

import XCTest
@testable import SignUpSample

class US1S11WebsiteIsOptionalTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam"
        viewModel.email = "robo8590@gmail.com"
        viewModel.password = "Nam12!"
        viewModel.currentStep = .enteringWebsite
        XCTAssertEqual(viewModel.website, "")
        XCTAssertTrue(viewModel.isCurrentInputValid)

        // When
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .viewingTermOfUse)
        XCTAssertTrue(viewModel.isCurrentInputValid)
    }
}
