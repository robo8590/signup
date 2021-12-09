# Sign Up Sample
This is a sample code for the sign up function using SwiftUI and MVVM architecture and Swift Concurrency.
This project has been developed using BDD and TDD process so the code structure has been organized based on test driven.
The unit tests and ui tests code structure has been created based on the test scenarios.

## Techniques
1. Architecture: MVVM.
2. Language: Swift 5.5.
3. API: SwiftUI, Swift Concurrency, XCUITest.
4. Tools: Xcode 13.1, SwiftLint 0.45.1, Git 2.30.1, Mermaidv8.13.4 Live Editor.
5. Coding convention: [The Official raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide).
6. Server: MockServer inside the application.

## Requirements
The details requirements is on the Wiki page at this link [Requirements](https://github.com/robo8590/signup/wiki/Requirements).

## Server API
The details server API is on the Wiki page at this link [Server API](https://github.com/robo8590/signup/wiki/Server-REST-API).

## Check List
|Scenario|Unit Test|UI Test|Code|
|-|-|-|-|
|US1-S1 - Scenario 1: The first name is optional.|Yes|Yes|Yes|
|US1-S2 - Scenario 2: The first name limits 200 characters.|Yes|Yes|Yes|
|US1-S3 - Scenario 3: The email is required.|Yes|Yes|Yes|
|US1-S4 - Scenario 4: The email is invalid.|Yes|Yes|Yes|
|US1-S5 - Scenario 5: The email is valid.|Yes|Yes|Yes|
|US1-S6 - Scenario 6: The email limits 200 characters.|Yes|Yes|Yes|
|US1-S7 - Scenario 7: The password is required.|Yes|Yes|Yes|
|US1-S8 - Scenario 8: The password is invalid.|Yes|Yes|Yes|
|US1-S9 - Scenario 9: The password is valid.|Yes|Yes|Yes|
|US1-S10 - Scenario 10: The password limits 200 characters.|Yes|Yes|Yes|
|US1-S11 - Scenario 11: The website is optional.|Yes|Yes|Yes|
|US1-S12 - Scenario 12: The website limits 200 characters.|Yes|Yes|Yes|
|US1-S13 - Scenario 13: The website is invalid.|Yes|Yes|Yes|
|US1-S14 - Scenario 14: Term of use.|Yes|Yes|Yes|
|US1-S15 - Scenario 15: The email is already in use.|Yes|Yes|Yes|
|US1-S16 - Scenario 16: The account is created successfully.|Yes|Yes|Yes|
|US1-S17 - Scenario 17: The device is offline.|No|No|No|
|US2-S1 - Scenario 1: Light mode.|No|No|Yes|
|US2-S2 - Scenario 2: Dark mode.|No|No|Yes|
|US2-S3 - Scenario 3: Set Light/Dark automatically: Dark mode.|No|No|Yes|
|US2-S3 - Scenario 3: Set Light/Dark automatically: Dark mode.|No|No|Yes|
|US3-S1 - Scenario 1: Preferred language is English.|No|No|Yes|
|US3-S2 - Scenario 2: Preferred language is Vietnamese.|No|No|Yes|

## High Level Class Diagram
[![](https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG4gICAgU2lnblVwVmlldy0tPlNpZ25VcFZpZXdNb2RlbFxuICAgIFNpZ25VcENvbmZpcm1hdGlvblZpZXctLT5TaWduVXBDb25maXJtYXRpb25WaWV3TW9kZWxcbiAgICBTaWduVXBWaWV3TW9kZWwtLT5BY2NvdW50U2VydmljZVxuICAgIFNpZ25VcFZpZXdNb2RlbC0tPk5ldHdvcmtTdGF0dXNcbiAgICBBY2NvdW50U2VydmljZS0tPkNvbmZpZ1xuICAgIEFjY291bnRTZXJ2aWNlLS0-VVJMU2Vzc2lvblxuICAgIFVSTFNlc3Npb248fC0tTW9ja1NlcnZlclxuICAgIFxuICAgICAgICAgICAgIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRhcmsifSwidXBkYXRlRWRpdG9yIjp0cnVlLCJhdXRvU3luYyI6ZmFsc2UsInVwZGF0ZURpYWdyYW0iOmZhbHNlfQ)](https://mermaid.live/edit/#eyJjb2RlIjoiY2xhc3NEaWFncmFtXG4gICAgU2lnblVwVmlldy0tPlNpZ25VcFZpZXdNb2RlbFxuICAgIFNpZ25VcENvbmZpcm1hdGlvblZpZXctLT5TaWduVXBDb25maXJtYXRpb25WaWV3TW9kZWxcbiAgICBTaWduVXBWaWV3TW9kZWwtLT5BY2NvdW50U2VydmljZVxuICAgIFNpZ25VcFZpZXdNb2RlbC0tPk5ldHdvcmtTdGF0dXNcbiAgICBBY2NvdW50U2VydmljZS0tPkNvbmZpZ1xuICAgIEFjY291bnRTZXJ2aWNlLS0-VVJMU2Vzc2lvblxuICAgIFVSTFNlc3Npb248fC0tTW9ja1NlcnZlclxuICAgIFxuICAgICAgICAgICAgIiwibWVybWFpZCI6IntcbiAgXCJ0aGVtZVwiOiBcImRhcmtcIlxufSIsInVwZGF0ZUVkaXRvciI6dHJ1ZSwiYXV0b1N5bmMiOmZhbHNlLCJ1cGRhdGVEaWFncmFtIjpmYWxzZX0)

```mermaid
classDiagram
    SignUpView-->SignUpViewModel
    SignUpConfirmationView-->SignUpConfirmationViewModel
    SignUpViewModel-->AccountService
    SignUpViewModel-->NetworkStatus
    AccountService-->Config
    AccountService-->URLSession
    URLSession<|--MockServer
