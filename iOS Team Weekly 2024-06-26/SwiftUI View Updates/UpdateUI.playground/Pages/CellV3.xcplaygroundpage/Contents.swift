//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct Demo3: View {
    
    @StateObject var store = MyStore()
    
    var body: some View {
        
        VStack {
            
            if let currentID = store.selection {
                Text("Current ID: \(currentID)")
            }
            
            List {
                ForEach(0..<10) { i in
                    CellView(id: i, action: store.sendID)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct CellView: View {
    
    let id: Int
    let action: (Int) -> Void // меняем определение функции
    
    init(id: Int, action: @escaping (Int) -> Void) {
        self.id = id
        self.action = action
    }

    var body: some View {
        VStack {
            let _ = print("update \(id)")
            let _ = Self._printChanges()
            Button("ID: \(id)") {
                action(id)
            }
        }
    }
}

class MyStore: ObservableObject {
    
    @Published var selection: Int?
    
    func sendID(_ id: Int) {
        self.selection = id
    }
}

let view = Demo3()
PlaygroundPage.current.setLiveView(view)

//: [Next](@next)
