//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {

    @State private var target: Box = .blue
    @Namespace private var namespace
    
    enum Box: Hashable {
        case blue
        case red
        case yellow
        
        public func colorForBox() -> Color {
            switch self {
            case .blue:
                return .blue
            case .red:
                return .red
            case .yellow:
                return .yellow
            }
        }
    }

    private func box(_ box: Box, size: CGFloat) -> some View {
        box.colorForBox()
            .frame(width: size, height: size)
            .matchedGeometryEffect(
                id: box,
                in: namespace,
                isSource: target == box
            )
    }

    private func switchPosition() {
        
        let targetBox: Box
        let via: Box
        
        switch target {
        case .blue:
            via = .yellow
            targetBox = .red
            
        case .yellow:
            via = .red
            targetBox = .blue
            
        case .red:
            via = .blue
            targetBox = .yellow
        }
        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.5
        ) {
            withAnimation(.spring(duration: 2)) {
                target = targetBox
            }
        }
        
        withAnimation(.spring(duration: 2)) {
            target = via
        }
    }

    var body: some View {
        
        VStack(spacing: 40) {
            
            ZStack {
                Color.clear
            }
            .overlay(alignment: .top) {
                box(.blue, size: 100)
            }
            .overlay(alignment: .bottomLeading) {
                box(.yellow, size: 80)
            }
            .overlay(alignment: .trailing) {
                box(.red, size: 175)
            }
            .overlay {
                Color.gray
                    .opacity(0.5)
                    .border(.gray)
                    .matchedGeometryEffect(
                        id: target,
                        in: namespace,
                        isSource: false
                    )
            }
            .frame(height: 450)
            .frame(maxWidth: .infinity)
            .padding()

            Button(
                "Switch position",
                action: switchPosition
            ).buttonStyle(.borderedProminent)
        }
    }
}

let view = ContentView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
