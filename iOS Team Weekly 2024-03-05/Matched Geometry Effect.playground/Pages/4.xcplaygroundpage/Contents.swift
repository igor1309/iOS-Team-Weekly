//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ExplosionView : View {
        
    var body: some View {
    
        Group {
            Spacer()
            Explosion()
            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct Explosion : View {
    
    private var sentence = "Lorem ipsum dolor sit amet"
    
    @State private var animate : Bool = false
    @Namespace private var animation
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
    var body: some View {
        
        VStack {
            if !animate {
                
                HStack {
                    
                    ForEach(sentence.split(separator: " "), id:\.self) { word in
                        Text(word).matchedGeometryEffect(id: word, in: animation)
                    }
                }
                
            } else {
                
                ForEach(sentence.split(separator: " "), id:\.self) { word in
                    
                    Text(word)
                        .matchedGeometryEffect(id: word, in: animation)
                        .rotationEffect(.degrees(
                            animate ? Double(Int.random(in: -270...270)) : 0)
                        )
                        .offset(
                            x: animate ? CGFloat(Int.random(in: -10...10)) : 0,
                            y: animate ? CGFloat(Int.random(in: -10...10)) : 0)
                    
                }.zIndex(2)
            }
        }
        .font(.body)
        .animation(.bouncy, value: animate)
        .onReceive(timer) { input in
            
            animate.toggle()
        }
        .frame(width: 300, height: 300)
    }
}

let view = ExplosionView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
