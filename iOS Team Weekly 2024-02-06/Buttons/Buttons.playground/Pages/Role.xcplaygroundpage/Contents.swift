//: A SwiftUI based Playground for presenting user interface
 // role - ios 15+

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    var body: some View {
        
        VStack(spacing: 30) {
            Button {
            } label: {
                Label("default", systemImage: "circle")
            }

            Button(role: .destructive) {
            } label: {
                Label("destructive button", systemImage: "trash")
            }

            Button(role: .cancel) {
            } label: {
                Label("cancel button", systemImage: "circle")
            }

            Menu("menu button") {
                
                Button {
                } label: {
                    Label("default", systemImage: "circle")
                }
                
                Button(role: .destructive) {
                } label: {
                    Label("destructive", systemImage: "trash")
                }
            }
        }
    }
}

// Present the view
let view = ContentView()
    .frame(
        width: 400,
        height: 400,
        alignment: .center
    )

PlaygroundPage.current.setLiveView(view)
//: [Control Size](@next)
