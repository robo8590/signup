//
//  URLSession.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/8/21.
//

import Foundation

/// Define the url session protocol to help us to make HTTP request
protocol URLSessionProtocol {
    /// Downloads the contents of a URL based on the specified URL request and delivers the data asynchronously.
    /// - Parameter request: the url request
    /// - Throws: the error during request
    /// - Returns: the data and url response object
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await self.data(for: request, delegate: nil)
    }
}
