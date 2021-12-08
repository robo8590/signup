//
//  XCUIElementExtension.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/7/21.
//

import XCTest

extension XCUIElement {
    /// Clear text of the text field
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        self.typeText(deleteString)
    }
}
