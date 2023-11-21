import Foundation
import Publish
import Plot

struct ItemDetails: Component {
    let item: Item<LearningProgress>
    
    var body: Component {
        Article {
            Div {
                if let imagePath = item.imagePath {
                    Image(imagePath: imagePath, alt: item.title)
                }
                
                Info(
                    title: item.title,
                    status: item.metadata.status,
                    description: item.description
                )
            }
            .class("general")
            
            if let todos = item.metadata.todos {
                let formatedTodos = formatedTodos(by: todos)
                let progressValue = progressValue(by: formatedTodos)
                
                Subtitle(text: "Progress")
                
                Progress(value: progressValue)
    
                Subtitle(text: "Todo")
                
                Todos(formatedTodos: formatedTodos)
            }
            
            if let attachments = item.metadata.attachments {
                let formatedAttachments = formatedAttachments(by: attachments)
                
                Subtitle(text: "Attachments")
                
                Attachments(formatedAttachments: formatedAttachments)
            }
        }
        .class("item-details")
    }
}

private extension ItemDetails {
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
                    H1(title)
                    
                    Badge(text: status, style: badgeStyle(by: status))
                }
                .class("title")
                
                Paragraph(description)
                    .class("description")
            }
            .class("info")
        }
    }
    
    struct Subtitle: Component {
        let text: String
        
        var body: Component {
            ComponentGroup {
                Div()
                    .class("hr")
                
                H2(text)
                    .class("subtitle")
            }
        }
    }
}
