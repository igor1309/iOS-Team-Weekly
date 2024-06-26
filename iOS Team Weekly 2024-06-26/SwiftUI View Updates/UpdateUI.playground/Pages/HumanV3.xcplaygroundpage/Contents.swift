//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct Human {
    var name: String
    var age: Int
}

struct Demo: View {
    
    @State var human = Human(name: "Ivan", age: 88)
    
    var body: some View {
        
        VStack{
            NameView(name: human.name)
            AgeView(age: human.age)
            Button("random age"){
                human.age = Int.random(in: 0...99)
            }
        }
    }
}

struct NameView: View {
    
    let name: String
    
    var body: some View{
        let _ = Self._printChanges()
        Text(name)
    }
}

struct AgeView:View{
    
    let age: Int
    
    var body: some View {
        let _ = Self._printChanges()
        Text(age, format: .number)
    }
}

let view = Demo()
PlaygroundPage.current.setLiveView(view)

//: [Next](@next)
