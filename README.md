# DeepSeek Base Client

An unofficial Dart client library for interacting with the DeepSeek API, providing functionalities to send messages and receive responses from the DeepSeek service.

## Features

**Message Sending**: Easily send messages to the DeepSeek service and handle responses.

**Model Selection**: Support for different models (`chat`, `coder`) to tailor the AI's responses to various contexts.

## Getting Started

### Prerequisites

**Obtain an API Key**: Register on [the DeepSeek platform](https://platform.deepseek.com/api_keys) to get your API key. As part of the registration process, you will receive 4 million tokens for free.
  
**Pass the API Key**: Pass the obtained API key to your Dart application using the `deepseek_token` environment variable. This can be done by setting the environment variable in your operating system or directly in your Dart code using the `--dart-define` flag when launching your application

### Installation

Add `deepseek` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  deepseek_client: ^latest_version
```

Replace `^latest_version` with the actual latest version available on [pub.dev](https://pub.dev/packages/deepseek_client).

### Example Usage

Here's a simple example of how to use the `DeepSeekApiClient` to send a message and print the response:

```dart
import 'package:deepseek/deepseek.dart';

void main() async {
  final deepSeekClient = DeepSeekClient();

  final response = await deepSeekClient.sendMessage(
    messages: [
      Message(content: "Hello, how can I assist you?", role: "system"),
    ],
    model: DeekSeekModels.chat,
  );

  print(response.choices.first.message.content);
}
```

Please note, this is an unofficial implementation and should be used with caution. Always ensure to review and test thoroughly before integrating into production environments.

## Contributing

Contributions are welcome. Please feel free to submit pull requests or open issues for discussion.

## License

This project is licensed under the MIT License - see the LICENSE file for details.