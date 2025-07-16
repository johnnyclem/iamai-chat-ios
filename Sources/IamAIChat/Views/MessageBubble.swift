import SwiftUI

struct MessageBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.role == .user { Spacer() }
            Text(message.content)
                .padding(8)
                .background(message.role == .user ? Color.blue : Color.gray.opacity(0.3))
                .foregroundColor(message.role == .user ? .white : .primary)
                .cornerRadius(12)
            if message.role == .assistant { Spacer() }
        }
        .animation(.easeInOut, value: message.content)
    }
}
