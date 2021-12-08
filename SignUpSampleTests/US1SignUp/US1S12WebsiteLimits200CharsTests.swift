//
//  US1S12WebsiteLimits200CharsTests.swift
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
//  US1-S12 - Scenario 12: The website limits 200 characters.
//  
//  Given I started the sign up wizard
//  and I went to the step to enter the website
//  and the website field was focused on
//  and the keyboard was presented
//  when I enter more than 200 characters
//  then the website name field only accepts 200 characters.
//

import XCTest
@testable import SignUpSample

class US1S12WebsiteLimits200CharsTests: XCTestCase {
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
        let input = "http://www.linkedin.com/in/robo8590/NamTranNamTranNamTranNamTranNamTran"
        + "NamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTran"
        + "NamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTran"
        viewModel.website = input
        viewModel.handleWebsiteOnChange()

        // Then
        XCTAssertEqual(viewModel.website, String(input.prefix(200)))
        XCTAssertTrue(viewModel.isCurrentInputValid)
    }
}
