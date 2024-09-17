import Foundation

final class ViewModel<State>: ObservableObject {
    
    @Published var state: State
    
    init(state: State) { self.state = state }
}

//: [Next](@next)
