import SwiftUI
import SwiftData

@main
struct IamAIChatApp: App {
    @StateObject private var viewModel: ChatViewModel

    init() {
        let container = try! ModelContainer(for: ChatMessage.self)
        let agent = try! AgentService(endpoint: nil)
        _viewModel = StateObject(wrappedValue: ChatViewModel(modelContext: container.mainContext, agent: agent))
    }

    var body: some Scene {
        WindowGroup {
            ChatView()
                .environment(viewModel)
        }
    }
}
