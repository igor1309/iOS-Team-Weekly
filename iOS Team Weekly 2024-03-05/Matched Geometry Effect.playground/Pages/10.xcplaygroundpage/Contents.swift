//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    @State var isExpanded: Bool = true
    @Namespace var nameSpace
    
    var body: some View {
        VStack {
            if isExpanded {
                smallSizeView()
            } else {
                largeSizeView()
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
    
    func smallSizeView() -> some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(.black)
            .matchedGeometryEffect(
                id: "id",
                in: nameSpace,
                anchor: .center
            )
            .frame(width: 300,height: 300)

            .overlay {
                Text("Toggle")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
    }
    
    func largeSizeView() -> some View {
        
        Circle()
            .fill(.black)
            .matchedGeometryEffect(
                id: "id",
                in: nameSpace
            )
            .frame(width: 100,height: 100)
            .overlay {
                Text("Destination")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
    }
    
}

let view = ContentView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC
//: [Next](@next)
