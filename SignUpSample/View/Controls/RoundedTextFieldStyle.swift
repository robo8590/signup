//
//  RoundedTextFieldStyle.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/6/21.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.lightGray, lineWidth: 2)
            )
    }
}

#if DEBUG
struct RoundedTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack(alignment: .leading) {
                Text("First Name (Optional)")
                    .fontWeight(.semibold)
                    .foregroundColor(.darkGray)
                    .padding()
                TextField("", text: .constant(""))
                    .textFieldStyle(RoundedTextFieldStyle())
            }
            .preferredColorScheme(.light)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Light Mode")

            ZStack(alignment: .leading) {
                Text("First Name (Optional)")
                    .fontWeight(.semibold)
                    .foregroundColor(.darkGray)
                    .padding()
                TextField("", text: .constant(""))
                    .textFieldStyle(RoundedTextFieldStyle())
            }
            .preferredColorScheme(.dark)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Dark Mode")
        }
    }
}
#endif
