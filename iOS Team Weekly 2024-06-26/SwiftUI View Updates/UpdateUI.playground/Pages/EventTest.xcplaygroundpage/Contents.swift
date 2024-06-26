//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct EventSourceTest: View {
    
    @State private var enable = false
    
    var body: some View {
        
        VStack {
            let _ = Self._printChanges()
            Button(enable ? "Stop" : "Start") {
                enable.toggle()
            }
            TimeView(enable: enable)
        }
    }
}

struct TimeView: View {
    
    let enable:Bool
    
    @State private var timestamp = Date.now
    
    var body: some View{
        
        let _ = Self._printChanges()
        
        Text(
            timestamp,
            format: .dateTime.hour(.twoDigits(amPM: .abbreviated)).minute(.twoDigits).second(.twoDigits)
        )
        .background(
            Group {
                if enable { // Триггер загружается только при необходимости
                    Color.clear
                        .task {
                            while !Task.isCancelled {
                                try? await Task.sleep(nanoseconds: 1000000000)
                                NotificationCenter.default.post(name: .test, object: Date())
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: .test)) { notification in
                            if let date = notification.object as? Date {
                                timestamp = date
                            }
                        }
                }
            }
        )
    }
}

extension Notification.Name {
    static let test = Notification.Name("test")
}

let view = EventSourceTest().frame(width: 150, height: 100)
PlaygroundPage.current.setLiveView(view)


//: [Next](@next)
