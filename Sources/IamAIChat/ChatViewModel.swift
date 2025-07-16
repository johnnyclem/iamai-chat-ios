import SwiftData
import SwiftUI

@MainActor
public final class ChatViewModel: ObservableObject {
    @Published public var messages: [ChatMessage] = []
    private let modelContext: ModelContext
    private let agent: AgentService

    public init(modelContext: ModelContext, agent: AgentService) {
        self.modelContext = modelContext
        self.agent = agent
    }

    public func send(_ text: String) async {
        let user = ChatMessage(role: .user, content: text)
        modelContext.insert(user)

        let assistant = ChatMessage(role: .assistant, content: "", parent: nil)
        assistant.isStreaming = true
        modelContext.insert(assistant)

        for try await chunk in agent.streamResponse(to: text) {
            assistant.content = chunk
            try? modelContext.save()
        }
        assistant.isStreaming = false
        try? modelContext.save()
    }
}
