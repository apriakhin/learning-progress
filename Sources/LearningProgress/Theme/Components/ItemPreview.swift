import Foundation
import Publish
import Plot

struct ItemPreview: Component {
    let item: Item<LearningProgress>

    var body: Component {
        Article {
            Link(url: item.path.absoluteString) {
                if let imagePath = item.imagePath {
                    Image(imagePath: imagePath, alt: item.title)
                }
                
                Info(
                    title: item.title,
                    status: item.metadata.status,
                    description: item.description
                )
            }
        }
        .class("item-preview")
    }
}

private extension ItemPreview {
    struct Image: Component {
        let imagePath: Path
        let alt: String
        
        var body: Component {
            Div {
                Img(src: imagePath.absoluteString, alt: alt)
            }
            .class("image")
        }
    }
    
    struct Info: Component {
        let title: String
        let status: String
        let description: String
        
        var body: Component {
            Div {
                Div {
                    H2(title)
                    
                    Badge(text: status, style: badgeStyle(by: status))
                }
                .class("title")
                
                Paragraph(description)
                    .class("description")
            }
            .class("info")
        }
    }
}
