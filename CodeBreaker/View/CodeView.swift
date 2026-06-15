import SwiftUI

struct CodeView<AncillaryView>: View where AncillaryView: View {
    // MARK: Data in
    let code: Code
    
    // MARK: Data shared with me
    @Binding var selection: Int
    
    @ViewBuilder let ancillaryView: () -> AncillaryView
    
    // MARK: - Body
    var body: some View {
        HStack {
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
            
            Rectangle()
                .foregroundStyle(Color.clear)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    ancillaryView()
                }
        }
    }
}

fileprivate struct Selection {
    static let border: CGFloat = 6
    static let cornerRadius: CGFloat = 10
    static let opacity: CGFloat = 0.5
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
}
