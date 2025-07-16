import SwiftUI
import SwiftData

struct ChatView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    @State private var text: String = ""

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            HStack {
                TextField("Message", text: $text)
                    .textFieldStyle(.roundedBorder)
                Button("Send") {
                    let t = text
                    text = ""
                    Task { await viewModel.send(t) }
                }
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatViewModel(modelContext: .init(container: .init(for: ChatMessage.self)), agent: DummyAgent()))
    }
}

private final class DummyAgent: AgentService {
    init() {
        try! super.init(endpoint: nil)
    }
    override func streamResponse(to prompt: String) -> AsyncThrowingStream<String, Error> {
        var isYielded = false
        return .init { continuation in
            if !isYielded {
                continuation.yield("Echo: \(prompt)")
                isYielded = true
            }
            continuation.finish()
        }
    }
}
