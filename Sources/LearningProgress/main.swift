import Foundation
import Publish
import Plot

struct LearningProgress: Website {
    enum SectionID: String, WebsiteSectionID {
        case books
        case courses
        case articles
        case videos
    }

    struct ItemMetadata: WebsiteItemMetadata {
        let status: String
        let todos: [String]?
        let attachments: [String]?
    }

    var url = URL(string: "https://learning-progress.apriakhin.ru/")!
    var name = "Learning Progress"
    var description = "A description of Learning Progress"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try LearningProgress().publish(
    using: [
        .copyResources(),
        .addMarkdownFiles(),
        .sortItems(by: \.date, order: .descending),
        .generateHTML(withTheme: .learningProgress),
        .deploy(using: .gitHub("apriakhin/learning-progress", branch: "gh-pages"))
    ]
)
