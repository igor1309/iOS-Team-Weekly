//: [Previous](@previous)

import Combine

protocol Emitter<Value> {
    
    associatedtype Value
    
    var valuePublisher: AnyPublisher<Value, Never> { get }
}

//: [Next](@next)
