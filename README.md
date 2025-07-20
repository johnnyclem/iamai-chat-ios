# IamAI Chat for iOS

This repository contains a minimal SwiftUI chat application powered by the open‑source **iamai‑core** library and a Model Context Protocol (MCP) compatible agent service. The project uses SwiftData for persistence and demonstrates streaming responses from either an on‑device model or a remote server.

## Requirements
- Xcode 15.2+
- iOS 17.0+

## Getting Started
Clone the repository and open the Swift package:

```bash
git clone https://github.com/your-org/iamai-chat-ios.git
open Package.swift
```

Run the app in the iOS Simulator or on a device from Xcode. The default configuration streams responses from the built‑in C implementation that simply echoes prompts.

## Tests
Unit tests can be executed with `swift test`:

```bash
swift test
```

## License
See [LICENSE](LICENSE) for details.
