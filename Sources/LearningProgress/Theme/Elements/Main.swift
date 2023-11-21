import Foundation
import Publish
import Plot

extension ElementDefinitions {
    public enum Main: ElementDefinition { public static var wrapper = Node.main }
}

public typealias Main = ElementComponent<ElementDefinitions.Main>
