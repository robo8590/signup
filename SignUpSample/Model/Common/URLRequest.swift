//
//  URLRequest.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/8/21.
//

import Foundation

extension URLRequest {
    /// Set parameters for a POST request
    /// - Parameter parameters: the parameters of the request
    mutating func setParameters(parameters: [String: String]) {
        let parametersArray = parameters.map { key, val -> String in
            let key = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let encodedValue = val.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return key + "=" + encodedValue
        }
        let parametersString = parametersArray.sorted().joined(separator: "&")
        self.httpBody = parametersString.data(using: .utf8)
    }
}
