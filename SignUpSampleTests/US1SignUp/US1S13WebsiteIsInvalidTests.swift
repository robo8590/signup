//
//  US1S13WebsiteIsInvalidTests.swift
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
//  US1-S13 - Scenario 13: The website is invalid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter an invalid website url
//  then the error message "The url is invalid" is showed
//  and the next button are disabled.
//

import XCTest
@testable import SignUpSample

class US1S13WebsiteIsInvalidTests: XCTestCase {
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
        viewModel.website = "abc"
        viewModel.handleWebsiteOnChange()

        // Then
        XCTAssertEqual(viewModel.currentError, .websiteIsInvalid)
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.website = "http://"
        viewModel.handleWebsiteOnChange()

        // Then
        XCTAssertEqual(viewModel.currentError, .websiteIsInvalid)
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.website = "www.linkedin.com"
        viewModel.handleWebsiteOnChange()

        // Then
        XCTAssertEqual(viewModel.currentError, .websiteIsInvalid)
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.website = "http://www.linkedin.com/in/robo8590"
        viewModel.handleWebsiteOnChange()

        // Then
        XCTAssertNil(viewModel.currentError)
        XCTAssertTrue(viewModel.isCurrentInputValid)
    }
}
