import Foundation
import Publish
import Plot

extension Theme {
    static var learningProgress: Theme<LearningProgress> {
        Theme<LearningProgress>(htmlFactory: LearningProgressHTMLFactory())
    }
}

private struct LearningProgressHTMLFactory: HTMLFactory {    
    func makeIndexHTML(for index: Index, context: PublishingContext<LearningProgress>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body {
                PageHeader(context: context, selectedSectionID: nil)
                
                PageContent(title: context.index.title) {
                    ComponentGroup {
                        let items = context.allItems(sortedBy: \.date, order: .descending)
                        
                        if (items.isEmpty) {
                            Empty()
                
                        } else {
                            List(items) { item in
                                ItemPreview(item: item)
                            }
                        }
                    }
                }
    
                PageFooter(context: context)
            }
        )
    }

    func makeSectionHTML(for section: Section<LearningProgress>, context: PublishingContext<LearningProgress>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body {
                PageHeader(context: context, selectedSectionID: section.id)
                
                PageContent(title: section.title) {
                    ComponentGroup {
                        let items = section.items
                        
                        if (items.isEmpty) {
                            Empty()
                    
                        } else {
                            List(items) { item in
                                ItemPreview(item: item)
                            }
                        }
                    }
                }
    
                PageFooter(context: context)
            }
        )
    }
    
    func makeItemHTML(for item: Item<LearningProgress>, context: PublishingContext<LearningProgress>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body {
                PageHeader(context: context, selectedSectionID: item.sectionID)
                
                PageContent {
                    ComponentGroup {
                        ItemDetails(item: item)
                    }
                }
                
                PageFooter(context: context)
            }
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<LearningProgress>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                PageHeader(context: context, selectedSectionID: nil)
                
                PageContent {
                    ComponentGroup {
                        page.body
                    }
                }
                
                PageFooter(context: context)
            }
        )
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<LearningProgress>) throws -> HTML? {
        HTML()
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<LearningProgress>) throws -> HTML? {
        HTML()
    }
}
