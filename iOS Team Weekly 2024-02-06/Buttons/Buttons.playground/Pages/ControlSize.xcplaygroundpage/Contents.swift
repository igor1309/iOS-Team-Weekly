//: [Role](@previous)

// controlSize - iOS 15+

import SwiftUI
import PlaygroundSupport

struct ControlSizeView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            
            Button {
                
            } label: {
                Label("Button", systemImage: "person")
            }
            .buttonStyle(.bordered)
            .controlSize(.mini)
            
            Button {
                
            } label: {
                Label("Button", systemImage: "person")
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
            
            Button {
                
            } label: {
                Label("Button", systemImage: "person")
            }
            .buttonStyle(.bordered)
            .controlSize(.regular) // default value
            
            Button {
                
            } label: {
                Label("Button", systemImage: "person")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button {
                
            } label: {
                Label("Button", systemImage: "person")
            }
            .buttonStyle(.bordered)
            .controlSize(.extraLarge) // ios 17.0
            
        }
    }
}

// Present the view
let view = ControlSizeView()
    .frame(
        width: 200,
        height: 400,
        alignment: .center
    )

PlaygroundPage.current.setLiveView(view)

//: [ConfirmationDialog](@next)
