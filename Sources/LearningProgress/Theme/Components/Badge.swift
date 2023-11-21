import Foundation
import Publish
import Plot

struct Badge: Component {
    let text: String
    let style: Style
    
    enum Style {
        case `default`
        case success
        case warning
        case error
    }
    
    private var color: String {
        switch style {
        case .default:
            "fill-accent"
        case .success:
            "fill-success"
        case .warning:
            "fill-warning"
        case .error:
            "fill-error"
        }
    }
    
    var body: Component {
        Span {
            Text(text)
        }
        .class("badge \(color)")
    }
}
