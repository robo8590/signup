//
//  MockAccountService.swift
//  SignUpSampleTests
//
//  Created by Nam Tran on 12/5/21.
//

import Foundation
@testable import SignUpSample

class MockAccountService: AccountServiceProtocol {
    var signedUpAccount: Account?
    var signedUpError: SignUpError?

    func signUp(account: Account) async throws {
        self.signedUpAccount = account
        if let error = self.signedUpError {
            throw error
        }
    }
}
