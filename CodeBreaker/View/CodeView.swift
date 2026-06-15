import SwiftUI

struct CodeView: View {
    // MARK: Data in
    let code: Code
    
    // MARK: Data shared with me
    @Binding var selection: Int
    
    // MARK: - Body
    var body: some View {
        ForEach(code.pegs.indices, id: \.self) { index in
            PegView(peg: code.pegs[index])
                .padding(Selection.border)
                .background{
                    if selection == index, code.kind == .guess {
                        Selection.shape
                            .foregroundStyle(Color.gray.opacity(Selection.opacity))
                    }
                }
                .overlay {
                    Selection.shape.foregroundStyle(code.isHidden ? Color.gray : Color.clear)
                }
                .onTapGesture {
                    selection = index
                }
        }
    }
}
