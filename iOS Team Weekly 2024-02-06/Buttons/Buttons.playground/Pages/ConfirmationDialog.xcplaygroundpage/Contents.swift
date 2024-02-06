//: [ControlSize](@previous)
// ios 15+

import SwiftUI
import PlaygroundSupport

struct ConfirmationDialogView: View {
    
    @State private var isShowingDialog = false
    
    var body: some View {
        
        Button("Delete", role: .destructive) {
            isShowingDialog = true
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .confirmationDialog(
            "Are you sure you want to delete it?",
            isPresented: $isShowingDialog,
            titleVisibility: .visible
        ) {
            Button("Yes", role: .destructive) {
                // set logic after click Yes button
            }
            Button("Yes") {
                // set logic after click Yes button
            }

            Button("No1", role: .cancel) {
                // set logic after click No button
            }

            Button("No", role: .cancel) {
                // set logic after click No button
            }
        }
    }
}

// Present the view
let view = ConfirmationDialogView()
    .frame(
        width: 400,
        height: 400,
        alignment: .center
    )

PlaygroundPage.current.setLiveView(view)
//: [BorderShape](@next)
