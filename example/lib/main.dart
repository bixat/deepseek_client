import 'package:deepseek/deepseek.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeepSeek Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DeepSeepChat(),
    );
  }
}

class DeepSeepChat extends StatefulWidget {
  const DeepSeepChat({super.key});

  @override
  DeepSeepChatState createState() => DeepSeepChatState();
}

class DeepSeepChatState extends State<DeepSeepChat> {
  final TextEditingController _controller = TextEditingController();
  final DeepSeekApiClient _deepSeek = DeepSeekApiClient();
  DeekSeekModels model = DeekSeekModels.chat;
  bool isLoading = false;
  final List<Message> _messages = [
    Message(content: "You are a helpful assistant", role: "system")
  ];
  String? _response;

  Future<void> _sendMessage() async {
    isLoading = true;
    _messages.add(Message(role: 'user', content: _controller.text));
    _controller.clear();
    setState(() {});
    final nonStream =
        await _deepSeek.sendMessage(messages: _messages, model: model);
    _response = nonStream.choices?.first.message?.content;
    _messages.add(Message(content: _response!, role: "assistant"));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DeepSeek Chat'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
                  items: DeekSeekModels.values
                      .map(
                        (e) => PopupMenuItem(
                          value: e.name,
                          child: Row(
                            children: [
                              if (model == e) const Icon(Icons.done),
                              Text(e.name),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ).then((value) {
                  if (value == 'chat') {
                    setState(() {
                      model = DeekSeekModels.chat;
                    });
                  } else if (value == 'coder') {
                    setState(() {
                      model = DeekSeekModels.coder;
                    });
                  }
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == _messages.length) {
                    return Container();
                  } else {
                    final message = _messages.reversed.toList()[index];
                    if (message.role == "system") {
                      return const SizedBox.shrink();
                    }
                    return ListTile(
                      title: Text(message.content),
                      subtitle: Text(message.role),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: const OutlineInputBorder(),
                    suffixIcon: Visibility(
                      visible: isLoading,
                      replacement: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                      child: Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
