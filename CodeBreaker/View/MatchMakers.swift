import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMakers: View {
    var matches: [Match]
    
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
        let exactCount = matches.count { $0 == .exact}
        let foundCount = matches.count { $0 != .nomatch}
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .overlay(
                Circle()
                    .stroke(Color.primary, lineWidth: 2)
            )
            .frame(width: 30, height: 30)
    }
}
