//
//  MockServer.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/8/21.
//

import Foundation

/// The list of errors of server
enum ServerError: Error {
    case serverDown
}

/// The data and state of server
struct ServerInfo: Decodable {
    /// The server state
    var state: Int

    /// The delay time by second
    var delayTime: Int

    /// The list of accounts
    var accounts: [String: Account]
}

/// This object helps to mock  a server
class MockServer: URLSessionProtocol {
    /// Good state
    static let good = 0
    /// Down state
    static let down = 1
    /// Error state
    static let error = 2

    /// The data and state of server
    var serverInfo: ServerInfo

    /// The config object
    var config: Config

    init() {
        serverInfo = ServerInfo(
            state: MockServer.good,
            delayTime: 1,
            accounts: [
                "robo8590@gmail.com": Account(firstName: "Nam", email: "robo8590@gmail.com", password: "Nam12!", website: "")
            ]
        )
        config = Config()
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        guard serverInfo.state != MockServer.down else {
            throw ServerError.serverDown
        }
        guard let url = request.url else {
            throw ServerError.serverDown
        }
        switch url.path {
        case config.signUpEndpoint:
            return try await signUp(request: request)
        default:
            throw ServerError.serverDown
        }
    }

    /// Handle signing up
    /// - Parameter request: the url request
    /// - Returns: the response
    func signUp(request: URLRequest) async throws -> (Data, URLResponse) {
        guard let url = request.url else {
            throw ServerError.serverDown
        }
        await Task.sleep(UInt64(serverInfo.delayTime) * 1_000_000_000)
        guard
            serverInfo.state != MockServer.error,
            let data = request.httpBody,
            let dataString = String(data: data, encoding: .utf8) else {
            return try createSignUpDataResponse(url: url, error: .internalServerError)
        }
        let parameters = dataString.components(separatedBy: "&")

        var firstName = ""
        var email = ""
        var password = ""
        var website = ""

        for parameter in parameters {
            let items = parameter.components(separatedBy: "=")
            if items.count == 2 {
                switch items[0] {
                case "firstName":
                    firstName = items[1]
                case "email":
                    email = items[1]
                case "password":
                    password = items[1]
                case "website":
                    website = items[1]
                default:
                    break
                }
            }
        }

        if serverInfo.accounts[email] != nil {
            return try createSignUpDataResponse(url: url, error: .emailIsAlreadyInUse)
        } else {
            let account = Account(firstName: firstName, email: email, password: password, website: website)
            serverInfo.accounts[email] = account
            return try createSignUpDataResponse(url: url, error: nil)
        }
    }

    /// Create signing up data response
    /// - Parameters:
    ///   - url: the request url
    ///   - error: the return error
    /// - Returns: the return response
    func createSignUpDataResponse(url: URL, error: SignUpError?) throws -> (Data, URLResponse) {
        var code = 0
        var message = ""

        switch error {
        case .emailIsAlreadyInUse:
            code = 1
            message = "Email is already in use"
        case .internalServerError:
            code = 2
            message = "Internal error"
        default:
            break
        }

        let dataString = "{\"statusCode\":\(code),\"message\":\"\(message)\"}"

        guard let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil) else {
            throw ServerError.serverDown
        }
        guard let data = dataString.data(using: .utf8) else {
            throw ServerError.serverDown
        }
        return (data, response)
    }
}
