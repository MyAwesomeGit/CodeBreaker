import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMakersView: View {
    // MARK: Data in
    let matches: [Match]
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack {
                matchMaker(peg: 0)
                matchMaker(peg: 1)
            }
            VStack {
                matchMaker(peg: 2)
                matchMaker(peg: 3)
            }
        }
    }
    
    func matchMaker(peg: Int) -> some View {
        let exactCount: Int = matches.count { $0 == .exact}
        let foundCount: Int = matches.count { $0 != .nomatch}
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 6)
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                Circle()
                    .stroke(Color.primary, lineWidth: 2)
            )
            .frame(width: 30, height: 30)
    }
}

#Preview {
    MatchMakersView(matches: [.exact, .inexact, .exact, .nomatch])
}
