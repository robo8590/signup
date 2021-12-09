//
//  SignUpConfirmationViewModel.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/5/21.
//

import Foundation

class SignUpConfirmationViewModel: ObservableObject {
    var account: Account

    init(_ account: Account) {
        self.account = account
    }
}
