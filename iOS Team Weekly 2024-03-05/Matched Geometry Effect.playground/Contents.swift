import SwiftUI
import PlaygroundSupport

struct MyExperimentalView: View {
        
    var body: some View {
        SampleView()
        Divider()
        SampleViewWithMatchedGeometryEffect()
    }
    
    struct SampleView: View {
        
        @State private var toggle = false
        @Namespace private var namespace
        
        var body: some View {
            Group() {
                if toggle {
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.red)
                            .frame(width: 60, height: 60)
                        
                        Text("Toggle").fontWeight(.semibold)
                    }
                } else {
                    HStack {
                        
                        Text("Toggle").fontWeight(.semibold)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.red)
                            .frame(width: 60, height: 60)
                    }
                }
            }.onTapGesture {
                withAnimation {
                    toggle.toggle()
                }
            }
        }
    }
    
    struct SampleViewWithMatchedGeometryEffect: View {
        
        @State private var toggle = false
        @Namespace private var namespace
        
        var body: some View {
            Group() {
                if toggle {
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .matchedGeometryEffect(id: "rectangle", in: namespace)
                            .foregroundColor(Color.red)
                            .frame(width: 60, height: 60)
                        
                        Text("Text").fontWeight(.semibold)
                            .matchedGeometryEffect(id: "text", in: namespace)
                    }
                } else {
                    HStack {
                        
                        Text("Text").fontWeight(.semibold)
                            .matchedGeometryEffect(id: "text", in: namespace)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .matchedGeometryEffect(id: "rectangle", in: namespace)
                            .foregroundColor(Color.red)
                            .frame(width: 60, height: 60)
                    }
                }
            }.onTapGesture {
                withAnimation {
                    toggle.toggle()
                }
            }
        }
    }
}

let view = MyExperimentalView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC
