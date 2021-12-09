//
//  SignUpResponse.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/8/21.
//

import Foundation

struct SignUpResponse: Decodable {
    /// The status code of signing up process
    var statusCode: Int
    /// The response message from server
    var message: String
}
