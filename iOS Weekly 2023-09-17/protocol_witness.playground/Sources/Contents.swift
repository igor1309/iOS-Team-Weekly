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
//extension ViewModel: Emitter where State == Int {
//
//    var valuePublisher: AnyPublisher<String, Never> {
//
//        $state.map { "\($0)" }.eraseToAnyPublisher()
//    }
//}

// MARK: - protocol witness

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
