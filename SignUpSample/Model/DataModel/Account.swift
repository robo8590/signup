//
//  Account.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/8/21.
//

import Foundation

struct Account: Decodable {
    /// The first name of the account
    var firstName: String
    /// The email of the account
    var email: String
    /// The password of the account
    var password: String
    /// The website of the account
    var website: String
}

extension Account: Equatable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.firstName == rhs.firstName
        && lhs.email == rhs.email
        && lhs.password == rhs.password
        && lhs.website == rhs.website
    }
}
