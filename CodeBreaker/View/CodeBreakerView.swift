import SwiftUI

struct CodeBreakerView: View {
    // MARK: Data owned by me
    @State private var game: CodeBreaker = CodeBreaker(pegChoises: [.brown, .yellow, .orange, .black])
    @State private var selection: Int = 0
    
    // MARK: - Body
    var body: some View {
        VStack {
            CodeView(code: game.masterCode) {
                EmptyView()
            }
            if !game.isOver {
                CodeView(code: game.guess, selection: $selection) {
                    guessButton
                }
            }
            ScrollView {
                ForEach(game.attempts.indices.reversed(), id:
                            \.self) { index in
                    CodeView(code: game.attempts[index]) {
                        if let matches = game.attempts[index].matches {
                            MatchMakersView(matches: matches)
                        }
                    }
                }
            }
            PegChooser(choices: game.pegChoises, onChoose: {peg in
                game.setGuessPeg(peg, at: selection)
                selection  = (selection + 1) % game.masterCode.pegs.count
            })
        }
        .padding()
    }
    
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
                selection = 0
            }
        }
        .font(.system(size: GuessButton.maximumFontSize))
        .minimumScaleFactor(GuessButton.scaleFactor)
    }
}


#Preview {
    CodeBreakerView()
}
