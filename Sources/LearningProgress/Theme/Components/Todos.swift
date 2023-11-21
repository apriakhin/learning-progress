import Foundation
import Publish
import Plot

struct Todos: Component {
    let formatedTodos: [(String, Bool)]
    
    var body: Component {
        Div {
            List(formatedTodos) { (text, isChecked) in
                Checkbox(text: text, isChecked: isChecked)
            }
        }
        .class("todos")
    }
}
