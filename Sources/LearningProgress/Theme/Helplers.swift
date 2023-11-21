import Foundation

func badgeStyle(by status: String) -> Badge.Style {
    switch status {
    case "To do":
        return .warning
    case "Done":
        return .success
    default:
        return .default
    }
}

func formatedTodos(by todos: [String]) -> [(String, Bool)] {
    return todos.map {
        let elements = $0.split(separator: ":")
        let text = String(elements.first ?? "")
        let isChecked = String(elements.last ?? "") == "true"
        return (text, isChecked)
    }
}

func progressValue(by formatedTodos: [(String, Bool)]) -> Int {
    let total = formatedTodos.count
    let doneCount = formatedTodos.filter { $0.1 }.count
    return Int(Double(doneCount) / Double(total) * 100)
}

func formatedAttachments(by attachments: [String]) -> [(String, String)] {
    return attachments.map {
        let elements = $0.split(separator: ":")
        let type = String(elements.first ?? "")
        let url = String(elements.last ?? "")
        return (type, url)
    }
}
