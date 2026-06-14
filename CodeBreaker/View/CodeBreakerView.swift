import SwiftUI

struct CodeBreakerView: View {
    // MARK: Data owned by me
    @State private var game: CodeBreaker = CodeBreaker(pegChoises: [.brown, .yellow, .orange, .black])
    @State private var selection: Int = 0
    
    // MARK: - Body
    var body: some View {
        VStack {
            view(for: game.masterCode)
            view(for: game.guess)
            ScrollView {
                
                ForEach(game.attempts.indices.reversed(), id:
                            \.self) { index in
                    view(for: game.attempts[index])
                }
            }
            pegChooser
        }
        .padding()
    }
    
    var pegChooser: some View {
        HStack {
            ForEach(game.pegChoises, id: \.self) {peg in
                Button {
                    game.setGuessPeg(peg, at: selection)
                } label: {
                    PegView(peg: peg)
                }
            }
        }
    }
    
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
            }
        }
        .font(.system(size: GuessButton.maximumFontSize))
        .minimumScaleFactor(GuessButton.scaleFactor)
    }
    
    func view(for code: Code) -> some View {
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
                    .onTapGesture {
                        selection = index
                    }
            }
            Rectangle()
                .foregroundStyle(Color.clear)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    if let matches = code.matches {
                        MatchMakersView(matches: matches)
                    } else {
                        if code.kind == .guess {
                            guessButton
                        }
                    }
                }
        }
    }
}


#Preview {
    CodeBreakerView()
}
