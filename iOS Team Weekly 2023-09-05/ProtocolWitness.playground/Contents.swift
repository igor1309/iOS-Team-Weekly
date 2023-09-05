protocol Communicate {
    
    func send(message: String)
}

struct Comm1: Communicate {
    
    func send(message: String) {
        // 1
        // 2
    }
}

struct Comm2 {
    
    let send: (String) -> Void
}

// ----
protocol CommunicateOLD {
    
    var message: String { get }
}

struct CommOLD<T> {
    
    let message: (T) -> String
}

struct Sample {
    
    let value: Int
}

let commOLD1: CommOLD<Sample> = .init { sample in "\(sample.value)" }
let commOLD2: CommOLD<Sample> = .init { sample in "Value: \(sample.value)" }

// ==========

// SwiftUI: View // strategy
// - image (png)
// - string1
// - string2
// - string3

// CustomStringConvertible
// print
// dump

// =====
let live: CommOLD<Sample> = .init { sample in "\(sample.value)" }
let debug: CommOLD<Sample> = .init { sample in "Value: \(sample.value)" }

struct ServerAgent<Command> {
    
    // func execute<Command>(_ command: Command) { //... }
    let execute: (Command) -> Void
}
