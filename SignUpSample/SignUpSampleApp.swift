//
//  SignUpSampleApp.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/5/21.
//

import SwiftUI
import os.log

@main
struct SignUpSampleApp: App {
    var body: some Scene {
        WindowGroup {
            SignUpView(viewModel: signUpViewModel)
        }
    }

    var signUpViewModel: SignUpViewModel {
        let viewModel = SignUpViewModel()

        #if DEBUG
        let args = ProcessInfo.processInfo.arguments
        for arg in args {
            guard arg.starts(with: "testing") else {
                continue
            }
            let testData = arg.suffix(arg.count - 7)
            guard !testData.isEmpty, let data = testData.data(using: .utf8) else {
                break
            }
            do {
                let serverInfo = try JSONDecoder().decode(ServerInfo.self, from: data)

                let mockServer = MockServer()
                mockServer.serverInfo = serverInfo

                var accountService = AccountService()
                accountService.session = mockServer

                viewModel.accountService = accountService
            } catch {
                Logger().error("\(error.localizedDescription)")
            }
            break
        }
        #endif
        return viewModel
    }
}
