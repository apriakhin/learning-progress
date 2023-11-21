import Foundation
import Publish
import Plot

struct PageContent: ComponentContainer {
    let title: String?
    @ComponentBuilder let content: ContentProvider
    
    init(content: @escaping ContentProvider) {
        self.title = nil
        self.content = content
    }
    
    init(title: String, content: @escaping ContentProvider) {
        self.title = title
        self.content = content
    }

    var body: Component {
        Main {
            if let title {
                H1(title)
                    .class("visually-hidden")
            }
            
            Div {
                content()
            }
            .class("page-content container")
        }
    }
}
