//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct MatchedGeometryEffectExample2: View {
    
    let categories: [String] = ["Home", "History", "Settings"]
    
    @State private var selected: String = "Home"
    @Namespace private var namespace
    
    var body: some View {
        
        HStack {
            
            ForEach(categories, id: \.self) { category in
                
                ZStack {
                    
                    if selected == category  {
                        
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "category", in: namespace)
                            .frame(width: 40, height: 2)
                            .offset(y: 20)
                    }
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        selected = category
                    }
                }
            }
        }
        .frame(width: 400)
        .padding()
    }
}

let view = MatchedGeometryEffectExample2()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
