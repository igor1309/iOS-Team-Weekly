//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @State var show = false
    @Namespace private var nameSpace
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Button("Show") {
                    show.toggle()
                }
                .sheet(isPresented: $show) {
                    
                    VStack {
                        
                        Button("Hide") {
                            show.toggle()
                        }
                        
                        RoundedRectangle(
                            cornerRadius: 20,
                            style: .circular
                        )
                            .fill(.red)
                            .matchedGeometryEffect(
                                id: "1",
                                in: nameSpace,
                                properties: .size,
                                isSource: false
                            )
                    }
                    .frame(width: 300, height: 300)
                    
                    Spacer()
                }
                
                Rectangle().fill(.green)
                    .frame(width: 100, height: 200)
                    .matchedGeometryEffect(id: "1", in: nameSpace)
            }
        }
        .animation(.easeInOut)
    }
}

let view = ContentView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
