import SwiftUI


struct PegView: View {
    // Mark: Data in
    let peg: Peg
    
    // Mark: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .overlay {
                if peg == Code.missingPeg {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.gray)
                }
            }
            .contentShape(Rectangle())
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(peg)
    }
}


#Preview {
    PegView(peg: .blue)
        .padding()
}
