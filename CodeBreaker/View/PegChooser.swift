import SwiftUI

struct PegChooser: View {
    // MARK: Data in
    let choices: [Peg]
    
    // MARK: Data out function
    let onChoose: ((Peg) -> Void)?
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(choices, id: \.self) {peg in
                Button {
                    onChoose?(peg)
                } label: {
                    PegView(peg: peg)
                }
            }
        }
    }
}
