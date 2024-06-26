import SwiftUI
import PlaygroundSupport

class TimerModel: ObservableObject {
    
    @Published var secondsElapsed = 0
    
    var timer = Timer()
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsElapsed += 1
        }
    }
}

struct ContentView: View {
    
    @StateObject var timer = TimerModel()
    
    var body: some View {
        let _ = Self._printChanges()
        Text("Sub View")
    }
}

let view = ContentView().frame(width: 100, height: 100)
PlaygroundPage.current.setLiveView(view)
//: [Next](@next)
