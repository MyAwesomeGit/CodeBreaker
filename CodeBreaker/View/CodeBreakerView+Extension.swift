import SwiftUI

extension CodeBreakerView {
    struct GuessButton {
        static let minimumFontSize: CGFloat = 8
        static let maximumFontSize: CGFloat = 80
        static let scaleFactor: CGFloat = minimumFontSize / maximumFontSize
    }
    
    struct Selection {
        static let border: CGFloat = 6
        static let cornerRadius: CGFloat = 10
        static let opacity: CGFloat = 0.5
        static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    }

}
