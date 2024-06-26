//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct Demo: View {
    
    @StateObject var store = MyStore()
    
    var body: some View {
        
        VStack {
            
            if let currentID = store.selection {
                Text("Current ID: \(currentID)")
            }
            
            List {
                ForEach(0..<10) { i in
                    CellView(id: i){ store.sendID(i) }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct CellView: View {
    
    let id: Int
    let action: () -> Void
    
    init(
        id: Int,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.action = action
    }
    
    var body: some View {
        VStack {
            let _ = print("update \(id)")
            let _ = Self._printChanges()
            Button("ID: \(id)") {
                action()
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

let view = Demo()
PlaygroundPage.current.setLiveView(view)

//: [Next](@next)
