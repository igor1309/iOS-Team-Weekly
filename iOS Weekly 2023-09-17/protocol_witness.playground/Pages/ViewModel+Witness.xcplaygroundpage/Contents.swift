//: [Previous](@previous)

import Combine

final class ViewModel<State>: ObservableObject {
    
    @Published var state: State
    
    init(state: State) { self.state = state }
}

struct Emitting<Model, Value> {
    
    let model: Model
    let valuePublisher: (Model) -> AnyPublisher<Value, Never>
}

extension Emitting where Model == ViewModel<Value> {
    
    static func simple(_ model: Model) -> Self {
        
        return .init(model: model) {
            
            $0.$state.eraseToAnyPublisher()
        }
    }
}

extension Emitting where Model == ViewModel<Int>, Value == String {
    
    static func simple(_ model: Model) -> Self {
        
        return .init(model: model) {
            
            $0.$state.map { "\($0)" }.eraseToAnyPublisher()
        }
    }
}
