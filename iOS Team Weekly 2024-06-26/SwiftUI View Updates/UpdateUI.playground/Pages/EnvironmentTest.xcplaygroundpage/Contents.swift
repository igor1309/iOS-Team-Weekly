//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct CustomEnvironmentKey: EnvironmentKey {
    static var defaultValue = 10
}

extension EnvironmentValues {
    var customValue: Int {
        get { self[CustomEnvironmentKey.self] }
        set { self[CustomEnvironmentKey.self] = newValue }
    }
}

struct Demo: View {
    
    @State var i = 100
    
    var body: some View {
        
        VStack {
            SubView()
                .environment(\.customValue, i)
            Button("change") { i += 1 }
        }
        .frame(width: 100, height: 100)
    }
}

struct SubView: View {
    
    @Environment(\.customValue) var customValue
    
    var body: some View {
        let _ = Self._printChanges()
        Text("Sub View")
    }
}

let view = Demo()
PlaygroundPage.current.setLiveView(view)

//: [Next](@next)

