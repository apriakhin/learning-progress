import Foundation
import Publish
import Plot

struct Checkbox: Component {
    let text: String
    let isChecked: Bool
    
    private var icon: String {
        isChecked ? "fa-solid fa-square-check" : "fa-regular fa-square"
    }
    
    private var color: String {
        isChecked ? "color-success" : "color-bg-secondary"
    }
    
    var body: Component {
        Div {
            Icon()
                .class("fa-lg \(icon) \(color)")
            
            Text(text)
        }
    }
}
