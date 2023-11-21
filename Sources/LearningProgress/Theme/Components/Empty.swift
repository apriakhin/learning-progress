import Foundation
import Publish
import Plot

struct Empty: Component {
    var body: Component {
        Div {
            Icon()
                .class("fa-solid fa-box-open fa-2xl color-warning")
            
            Paragraph {
                Text("It's empty for now.")
            }
        }
        .class("empty")
    }
}
