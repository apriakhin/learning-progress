import Foundation
import Publish
import Plot

struct Attachments: Component {
    let formatedAttachments: [(String, String)]
    
    var body: Component {
        Div {
            List(formatedAttachments) { (type, url) in
                Link(url: url) {
                    let className = type == "link" ? "fa-solid fa-file-lines fa-lg" : "fa-brands fa-\(type) fa-lg"
                    
                    Icon()
                        .class(className)
                }
                .linkTarget(.blank)
            }
        }
        .class("attachments")
    }
}
