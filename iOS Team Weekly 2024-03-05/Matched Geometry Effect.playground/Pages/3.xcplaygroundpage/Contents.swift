//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @State private var detail = false
    @Namespace private var namespace

    var body: some View {
        
        ZStack {
            if detail {
                Color.red
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
            } else {
                Circle().fill(.blue)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 300)
            }
        }
        .animation(.default, value: detail)
        .onTapGesture {
            detail.toggle()
        }
    }
}

let view = ContentView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
