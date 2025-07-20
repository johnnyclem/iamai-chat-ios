import Foundation
import Combine
import MCP

@MainActor
public final class AgentService {
    private let client = Client(name: "IamAI-Chat", version: "1.0.0")
    private var cancellables = Set<AnyCancellable>()

    public init(endpoint: URL?) async throws {
        let transport: Transport = endpoint == nil
            ? StdioTransport()
            : HTTPClientTransport(endpoint: endpoint!, streaming: true)
        try await client.connect(transport: transport)
    }

    public func streamResponse(to prompt: String) -> AsyncThrowingStream<String, Error> {
        client.chat(messages: [.init(role: .user, content: prompt)])
    }
}
