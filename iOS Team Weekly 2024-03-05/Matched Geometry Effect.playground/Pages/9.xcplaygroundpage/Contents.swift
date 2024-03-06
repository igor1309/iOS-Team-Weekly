//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @Namespace var nameSpace
    @State var isTemp: Bool = true
        
    var body: some View{
        
        ZStack {
            if isTemp{
                
                Circle()
                    .matchedGeometryEffect(
                        id: "id",
                        in: nameSpace,
                        properties: .frame,
                        anchor: .bottom,
                        isSource: false
                    )
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                
            } else {
                
                Rectangle()
                    .matchedGeometryEffect(
                        id: "id",
                        in: nameSpace
                    )
                    .foregroundColor(.orange)
            }
            
            Button {
                
                withAnimation(.linear(duration: 0.2)){
                    isTemp.toggle()
                }
                
            } label: {
                Text("switch")
            }
        }
        .frame(width: 200, height: 500)
    }
}

let view = ContentView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC
//: [Next](@next)
