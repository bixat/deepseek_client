import 'dart:convert';
import 'dart:developer';
import 'package:deepseek/src/deepseek_models.dart';
import 'package:deepseek/src/models/no_stream_model.dart';
import 'package:http/http.dart' as http;

import 'models/message_model.dart';

class DeepSeekApiClient {
  final String _baseUrl = 'https://api.deepseek.com';
  static const String _token = String.fromEnvironment("deepseek_token");
  Future<NoSream> sendMessage({
    required List<Message> messages,
    int frequencyPenalty = 0,
    int? maxTokens,
    int presencePenalty = 0,
    bool stream = false,
    double temperature = 1,
    double topP = 1,
    bool logProbs = false,
    dynamic stop,
    int? topLogProbs,
    DeekSeekModels model = DeekSeekModels.chat,
  }) async {
    // Check if _token is empty || null
    assert(_token.isNotEmpty, 'API token cannot be null.');
    // Validate integer parameters
    assert(frequencyPenalty >= -2 && frequencyPenalty <= 2,
        'Frequency penalty must be between -2 and 2.');
    assert(presencePenalty >= -2 && presencePenalty <= 2,
        'Presence penalty must be between -2 and 2.');
    assert(topLogProbs == null || (topLogProbs >= 0 && topLogProbs <= 20),
        'Top Log Probs must be between 0 and 20.');

    // Additional check for logProbs when topLogProbs is used
    if (topLogProbs != null && topLogProbs > 0) {
      assert(logProbs, 'logProbs must be true when topLogProbs is used.');
    }

    const String endpoint = '/chat/completions';
    final Map<String, dynamic> body = {
      'messages': messages.map((e) => e.toJson()).toList(),
      'model': 'deepseek-${model.name}',
      'frequency_penalty': frequencyPenalty,
      'max_tokens': maxTokens,
      'presence_penalty': presencePenalty,
      'stream': stream,
      'temperature': temperature,
      'top_p': topP,
      'logprobs': logProbs,
      'stop': stop,
      'top_logprobs': topLogProbs,
    };

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var decoded = jsonDecode(response.body);
        return NoSream.fromJson(decoded);
      } else {
        throw Exception('Failed to send message: ${response.body}');
      }
    } catch (e) {
      log('Error sending message: $e');
      rethrow;
    }
  }
}
