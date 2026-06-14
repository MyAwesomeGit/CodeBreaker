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
            PegChooser(choices: game.pegChoises, onChoose: {peg in
                game.setGuessPeg(peg, at: selection)
                selection = (selection + 1) % game.masterCode.pegs.count
            })
        }
        .padding()
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
            CodeView(code: code, selection: $selection)
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
