import Foundation
import Publish
import Plot

struct PageHeader: Component {
    let context: PublishingContext<LearningProgress>
    let selectedSectionID: LearningProgress.SectionID?

    var body: Component {
        Header {
            Div {
                Logo(text: context.site.name)
                
                if LearningProgress.SectionID.allCases.count > 1 {
                    Nav(
                        context: context,
                        selectedSectionID: selectedSectionID
                    )
                }
            }
            .class("container")
        }
        .class("page-header")
    }
}

private extension PageHeader {
    struct Logo: Component {
        let text: String
        
        var body: Component {
            Link(url: "/") {
                Icon()
                    .class("fa-solid fa-graduation-cap")
                
                Text(text)
            }
            .class("logo")
        }
    }
    
    struct Nav: Component {
        let context: PublishingContext<LearningProgress>
        let selectedSectionID: LearningProgress.SectionID?

        var body: Component {
            Navigation {
                List(LearningProgress.SectionID.allCases) { sectionID in
                    let section = context.sections[sectionID]
                    let linkClassName = sectionID == selectedSectionID ? "active" : ""
                    
                    return Link(
                        section.title,
                        url: section.path.absoluteString
                    )
                    .class(linkClassName)
                }
            }
            .class("nav")
        }
    }
}
