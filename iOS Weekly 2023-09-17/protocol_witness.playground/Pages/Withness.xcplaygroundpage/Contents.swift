//: [Previous](@previous)

import Combine

protocol Emitter<Value> {
    
    associatedtype Value
    
    var valuePublisher: AnyPublisher<Value, Never> { get }
}

struct Emitting<Model, Value> {
    
    let model: Model
    let valuePublisher: (Model) -> AnyPublisher<Value, Never>
}

//: [Next](@next)
