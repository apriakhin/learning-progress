import Foundation
import Publish
import Plot

struct Attachments: Component {
    let formatedAttachments: [(String, String)]
    
    var body: Component {
        Div {
            List(formatedAttachments) { (type, url) in
                Link(url: url) {
                    Icon()
                        .class("fa-brands fa-\(type) fa-lg")
                }
                .linkTarget(.blank)
            }
        }
        .class("attachments")
    }
}
