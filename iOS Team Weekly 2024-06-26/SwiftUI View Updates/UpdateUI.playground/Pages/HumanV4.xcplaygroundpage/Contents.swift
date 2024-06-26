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
            NameView(human: human)
            AgeView(human: human)
            Button("random age"){
                human.age = Int.random(in: 0...99)
            }
        }
    }
}

struct NameView: View, Equatable {
    
    let human: Human
    
    var body: some View{
        let _ = Self._printChanges()
        Text(human.name)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.human.name == rhs.human.name
    }
}

struct AgeView: View, Equatable {
    
    let human: Human
    
    var body: some View {
        let _ = Self._printChanges()
        Text(human.age, format: .number)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.human.age == rhs.human.age
    }
}

let view = Demo()
PlaygroundPage.current.setLiveView(view)

//: [Next](@next)
