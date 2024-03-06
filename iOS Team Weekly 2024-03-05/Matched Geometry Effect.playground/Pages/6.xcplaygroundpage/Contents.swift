//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct CollectionView: View {
    
    var data = [
        "Item 1",
        "Item 2",
        "Item 3",
        "Item 4",
        "Item 5"
    ]

    @State var selectedElement: String?
    @Namespace var namespace

    var body: some View {
        
        ZStack {
                
            ScrollView {
                
                LazyVGrid(columns: [GridItem(), GridItem()]){
                    
                    ForEach(data.indices, id: \.self) { idx in
                        
                        ElementView(text: data[idx])
                            .matchedGeometryEffect(
                                id: data[idx],
                                in: namespace,
                                properties: .position
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedElement = data[idx]
                                }
                            }
                    }
                }
            }
            .zIndex(1)
            
            if let selected = selectedElement {
                
                DetailView(
                    text: selected,
                    backDidTap: {
                        withAnimation {
                            selectedElement = nil
                        }
                })
                .matchedGeometryEffect(id: selected, in: namespace)
                .zIndex(2)
            }
        }
    }
    
    struct ElementView: View {
        
        let text: String
        
        var body: some View {
            
            LazyVStack(spacing: .zero) {
                
                Group {
                    
                    Color.black
                        .frame(width: 50, height: 50)
                    
                    Text(text)
                        .padding(.top, 8)
                        .frame(width: 50)

                }
            }
        }
    }
    
    struct DetailView: View {
        
        let text: String
        let backDidTap: () -> Void
        
        var body: some View {
           
            VStack(
                alignment: .leading,
                spacing: .zero
            ) {
               
                Color.black
                   .edgesIgnoringSafeArea(.all)
                   .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height * 0.5
                   )
                   .onTapGesture {
                       backDidTap()
                   }
               
                Text(text)
                   .padding(.top, 8)
                   .padding(.leading, 8)
               
                Spacer()
           }
        }
    }
}

let view = CollectionView()
let hostingVC = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = hostingVC

//: [Next](@next)
