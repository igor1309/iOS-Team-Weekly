//: [Previous](@previous)

import Combine

final class ViewModel<State>: ObservableObject {
    
    @Published var state: State
    
    init(state: State) { self.state = state }
}

protocol Emitter<Value> {
    
    associatedtype Value
    
    var valuePublisher: AnyPublisher<Value, Never> { get }
}

extension ViewModel: Emitter where State == String {
    
    var valuePublisher: AnyPublisher<String, Never> {
        
        $state.eraseToAnyPublisher()
    }
}

// Conflicting conformance of 'ViewModel<State>' to protocol 'Emitter'; there cannot be more than one conformance, even with different conditional bounds
extension ViewModel: Emitter where State == Int {

    var valuePublisher: AnyPublisher<String, Never> {

        $state.map { "\($0)" }.eraseToAnyPublisher()
    }
}

//: [Next](@next)
