//: [BorderShape](@previous)
// ios 13+

import SwiftUI
import PlaygroundSupport

struct ButtonStyleView: View {
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Button(role: .destructive) {} label: { Label("Delete", systemImage: "trash") }
            
            Button("Cancel", role: .cancel) {}
        }
        .buttonStyle(PressedButtonStyle())
        .padding()
    }
}

struct PressedButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        HStack {
            Text(configuration.isPressed ? "Tap" : "")
            configuration.label
        }
        .frame(maxWidth: .infinity)
        .padding()
        .font(
            .system(
                .title2,
                design: .rounded)
            .weight(.medium))
        .foregroundColor(
            configuration.role == .destructive
            ? .red
            : .primary)
        .background {
            Capsule()
                .stroke(
                    configuration.role == .destructive
                    ? .red
                    : .primary,
                    lineWidth: 2)
                .fill(
                    configuration.isPressed
                    ? .white
                    : .teal)
        }
        .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
        .animation(.easeInOut(duration: 1), value: configuration.isPressed)
    }
}

// Present the view
let view = ButtonStyleView()
    .frame(
        width: 400,
        height: 400,
        alignment: .center
    )

PlaygroundPage.current.setLiveView(view)

//: [Role](@first)
