//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct SubView: View {
    
    let name: String
    let age: Int
    
    var body: some View{
        
        VStack{
            Text(name)
            Text("\(age)")
            let _ = Self._printChanges()
        }
    }
}

struct Demo: View {
    
    @State var age: Int = 10
    
    var body : some View{
        
        SubView(name: "Ivan", age: age)
        Button("random age"){
            self.age = Int.random(in: 0...99)
        }
    }
}

let view = Demo()
PlaygroundPage.current.setLiveView(view)

//: [Next](@next)
