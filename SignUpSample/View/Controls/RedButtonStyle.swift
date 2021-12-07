//
//  RedButtonStyle.swift
//  SignUpSample
//
//  Created by Nam Tran on 12/6/21.
//

import SwiftUI

struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        RedButtonView(configuration: configuration)
    }

    struct RedButtonView: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: isEnabled ? [.customOrange, .customPink] : [.lightGray, .darkGray]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .foregroundColor(.white)
                .cornerRadius(15)
                .scaleEffect(configuration.isPressed ? 0.95: 1)
        }
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

            Button("Next") {
            }
            .buttonStyle(RedButtonStyle())
            .disabled(true)
            .preferredColorScheme(.light)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Light Mode Disabled")

            Button("Submit") {
            }
            .buttonStyle(RedButtonStyle())
            .preferredColorScheme(.dark)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Dark Mode")

            Button("Submit") {
            }
            .buttonStyle(RedButtonStyle())
            .disabled(true)
            .preferredColorScheme(.dark)
            .padding()
            .previewLayout(.fixed(width: 400, height: 100))
            .previewDisplayName("Dark Mode")
        }
    }
}
#endif
