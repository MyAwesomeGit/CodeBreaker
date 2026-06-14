import SwiftUI


struct PegView: View {
    // Mark: Data in
    let peg: Peg
    
    // Mark: - Body
    let pegShape = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        pegShape
            .overlay {
                if peg == Code.missingPeg {
                    pegShape
                        .strokeBorder(Color.gray)
                }
            }
            .contentShape(pegShape)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(peg)
    }
}


#Preview {
    PegView(peg: .blue)
        .padding()
}
