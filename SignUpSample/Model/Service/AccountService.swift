//
//  AccountService.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/5/21.
//

import Foundation
import os.log

// MARK: - Define the errors
enum SignUpError: Error {
    case firstNameIsInvalid
    case emailIsInvalid
    case passwordIsInvalid
    case websiteIsInvalid
    case emailIsAlreadyInUse
    case internalServerError
    case deviceIsOffline
    case unknown
}

// MARK: - Define the account service
protocol AccountServiceProtocol {
    /// Sign up an account
    /// - Parameter account: the account want to sign up
    func signUp(account: Account) async throws
}

/// The default implementation for account service protocol
struct AccountService: AccountServiceProtocol {
    /// The url session object
    var session: URLSessionProtocol = MockServer()
    /// The json decoder object
    var jsonDecoder = JSONDecoder()
    /// The config object
    var config: ConfigProtocol = Config()
    /// The logger object
    var logger = Logger()
}

// MARK: - Sign up
extension AccountService {
    func signUp(account: Account) async throws {
        let endpoint = try getSignUpEndpoint()
        let request = createSignUpRequest(at: endpoint, account: account)
        let (data, response) = try await session.data(for: request)
        try handleSignUpResponse(data: data, response: response)
    }

    /// Get the API endpoint url for signing up
    /// - Returns: the end point url
    func getSignUpEndpoint() throws -> URL {
        let endpointString = config.serverURL + config.signUpEndpoint
        guard let endpoint = URL(string: endpointString) else {
            logger.error("Couldn't create url object with \(endpointString)")
            throw SignUpError.unknown
        }
        return endpoint
    }

    /// Create signing up POST request
    /// - Parameters:
    ///   - endpoint: the API endpoint url
    ///   - account: the account want to sign up
    /// - Returns: the url request
    func createSignUpRequest(at endpoint: URL, account: Account) -> URLRequest {
        var request = URLRequest(url: endpoint)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters = [
            "firstName": account.firstName,
            "email": account.email,
            "password": account.password,
            "website": account.website
        ]
        request.setParameters(parameters: parameters)

        return request
    }

    /// Handle signing up response
    /// - Parameters:
    ///   - data: the data object
    ///   - response: the response object
    func handleSignUpResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            logger.error("The response is not a HTTP response")
            throw SignUpError.unknown
        }

        guard httpResponse.statusCode == 200 else {
            logger.error("The HTTP status code is \(httpResponse.statusCode)")
            throw SignUpError.internalServerError
        }

        let signUpResponse = try jsonDecoder.decode(SignUpResponse.self, from: data)
        logger.info("Sign up response: \(signUpResponse.statusCode): \(signUpResponse.message)")
        switch signUpResponse.statusCode {
        case 0:
            break
        case 1:
            throw SignUpError.emailIsAlreadyInUse
        case 2:
            throw SignUpError.internalServerError
        case 3:
            throw SignUpError.emailIsInvalid
        case 4:
            throw SignUpError.passwordIsInvalid
        case 5:
            throw SignUpError.firstNameIsInvalid
        case 6:
            throw SignUpError.passwordIsInvalid
        default:
            throw SignUpError.unknown
        }
    }
}
