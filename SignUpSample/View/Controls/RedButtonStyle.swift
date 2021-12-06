//
//  RedButtonStyle.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/6/21.
//

import SwiftUI

struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.customOrange, .customPink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .foregroundColor(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.95: 1)
    }
}

#if DEBUG
struct RedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("Next") {
            }
            .buttonStyle(RedButtonStyle())
            .preferredColorScheme(.light)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Light Mode")

            Button("Submit") {
            }
            .buttonStyle(RedButtonStyle())
            .preferredColorScheme(.dark)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Dark Mode")
        }
    }
}
#endif
