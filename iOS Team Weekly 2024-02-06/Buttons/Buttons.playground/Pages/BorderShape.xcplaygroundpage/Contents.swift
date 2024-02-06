//: [ConformitionDialog](@previous)

// iOS 15+

import SwiftUI
import PlaygroundSupport

struct BorderShapeView: View {
    
    var body: some View {
        
        VStack(spacing: 30) {

            Button("capsule", action: {})
            .buttonBorderShape(.capsule) // no effect on non-widget system buttons on macOS

            Button("roundedRectangle(radius: 15)", action: {})
            .buttonBorderShape(.roundedRectangle(radius: 15))

            Button("border roundedRectangle", action: {})
            .buttonBorderShape(.roundedRectangle)

            Button("automatic", action: {})
            .buttonBorderShape(.automatic)
            
            Button("circle", action: {})
            .buttonBorderShape(.circle) // ios 17
            
            Button("circle", action: {})
            .controlSize(.large)
            .buttonBorderShape(.circle) // ios 17
            
            Button(action: {}) {
              Text("circle")
                .padding()
            }
            .buttonBorderShape(.circle)  // iOS 17
        }
        .buttonStyle(.bordered)
    }
}

// Present the view
let view = BorderShapeView()
    .frame(
        width: 400,
        height: 500,
        alignment: .center
    )

PlaygroundPage.current.setLiveView(view)

//: [ButtonStyle](@next)
