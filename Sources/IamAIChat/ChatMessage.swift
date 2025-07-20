import SwiftData

@Model
public final class ChatMessage: Identifiable, Hashable {
    public var id: UUID = UUID()
    public var role: Role
    public var content: String
    public var createdAt: Date = .init()
    public var parent: ChatMessage?
    public var isStreaming: Bool = false

    public init(role: Role, content: String, parent: ChatMessage? = nil) {
        self.role = role
        self.content = content
        self.parent = parent
    }

    public enum Role: String, Codable {
        case user, assistant, system
    }
}
