import Foundation
import Publish
import Plot

struct Img: Component {
    var src: String
    var alt: String
    
    var body: Component {
        Node<HTMLImageContainerContext>.selfClosedElement(named: "img", attributes: [
            Attribute(name: "src", value: src),
            Attribute(name: "alt", value: alt)
        ])
    }
}
