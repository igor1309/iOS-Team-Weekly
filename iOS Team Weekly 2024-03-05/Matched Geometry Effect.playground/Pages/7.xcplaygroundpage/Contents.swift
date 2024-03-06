//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @State private var swap = false
    @Namespace private var nameSpace
    
    var body: some View {
        
        Group {
            if swap {
                
                HStack {
                    Circle()
                        .fill(Color.green)
                        .matchedGeometryEffect(id: "greenCircle", in: nameSpace)
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.orange)
                        .matchedGeometryEffect(id: "orangeCircle", in: nameSpace)
                        .frame(width: 30, height: 30)
                    
                }
                .frame(width: 100)
                .animation(.bouncy)
                .onTapGesture {
                    swap.toggle()
                }
                
            } else {
                
                HStack {
                    Circle()
                        .fill(Color.orange)
                        .matchedGeometryEffect(id: "orangeCircle", in: nameSpace)
                        .frame(width: 60, height: 60)
                    
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.green)
                        .matchedGeometryEffect(id: "greenCircle", in: nameSpace)
                        .frame(width: 60, height: 60)
                    
                }
                .frame(width: 100)
                .animation(.bouncy)
                .onTapGesture {
                    swap.toggle()
                }
            }
        }.frame(width: 300, height: 300)
    }
}

let view = ContentView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
