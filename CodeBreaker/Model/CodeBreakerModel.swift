import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = []
    let pegChoises: [Peg]
    
    init(pegChoises: [Peg] = [.red, .green, .blue, .yellow]) {
        self.pegChoises = pegChoises
        masterCode.randomize(from: pegChoises)
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoises.firstIndex(of: existingPeg) {
            let newPeg = pegChoises[(indexOfExistingPegInPegChoices + 1) % pegChoises.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoises.first ?? Code.missingPeg
        }
    }
}

