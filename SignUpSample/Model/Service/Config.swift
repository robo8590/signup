//
//  Config.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/8/21.
//

import Foundation

/// Define the config object
protocol ConfigProtocol {
    /// The server url
    var serverURL: String { get set }

    /// The sign up endpoint
    var signUpEndpoint: String { get set }
}

/// The defaul implement for config object
struct Config: ConfigProtocol {
    /// The user default object
    var userDefault = UserDefaults.standard

    var serverURL: String {
        get {
            return userDefault.string(forKey: "serverURL") ?? "https://www.robo8590serverdomain.com"
        }
        set {
            userDefault.set(newValue, forKey: "serverURL")
        }
    }

    var signUpEndpoint: String {
        get {
            return userDefault.string(forKey: "signUpEndpoint") ?? "/rest-api/sign-up"
        }
        set {
            userDefault.set(newValue, forKey: "signUpEndpoint")
        }
    }
}
