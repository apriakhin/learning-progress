import Foundation
import Publish
import Plot

struct PageFooter: Component {
    let context: PublishingContext<LearningProgress>
    
    private var year: Int? {
        Calendar.current.dateComponents([.year], from: .now).year
    }
    
    var body: Component {
        Footer {
            Paragraph {
                Text("Copyright © \(context.site.name) \(year ?? 2023).")
            }
            .class("copyright")
            
            Paragraph {
                Text("Generated using ")
                
                Link("Publish", url: "https://github.com/johnsundell/publish")
                
                Text(".")
            }
        }
        .class("page-footer")
    }
}
