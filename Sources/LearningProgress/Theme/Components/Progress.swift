import Foundation
import Publish
import Plot

struct Progress: Component {
    let value: Int
    
    private var color: String {
        value == 100 ? "fill-success" : "fill-warning"
    }
    
    var body: Component {
        Div {
            Div {
                Text("\(value)%")
            }
            .class("bar \(color)")
            .style("width: \(value)%")
        }
        .class("progress")
    }
}
