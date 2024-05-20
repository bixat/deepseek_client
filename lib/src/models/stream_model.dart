class DeepSeekStream {
  String? id;
  List<Choices>? choices;
  int? created;
  String? model;
  String? object;
  var systemFingerprint;
  Usage? usage;

  DeepSeekStream(
      {this.id,
      this.choices,
      this.created,
      this.model,
      this.object,
      this.systemFingerprint,
      this.usage});

  DeepSeekStream.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    created = json['created'];
    model = json['model'];
    object = json['object'];
    systemFingerprint = json['system_fingerprint'];
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    data['created'] = created;
    data['model'] = model;
    data['object'] = object;
    data['system_fingerprint'] = systemFingerprint;
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class Choices {
  Delta? delta;
  String? finishReason;
  int? index;
  var logprobs;

  Choices({this.delta, this.finishReason, this.index, this.logprobs});

  Choices.fromJson(Map<String, dynamic> json) {
    delta = json['delta'] != null ? Delta.fromJson(json['delta']) : null;
    finishReason = json['finish_reason'];
    index = json['index'];
    logprobs = json['logprobs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (delta != null) {
      data['delta'] = delta!.toJson();
    }
    data['finish_reason'] = finishReason;
    data['index'] = index;
    data['logprobs'] = logprobs;
    return data;
  }
}

class Delta {
  String? content;
  var functionCall;
  var role;
  var toolCalls;

  Delta({this.content, this.functionCall, this.role, this.toolCalls});

  Delta.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    functionCall = json['function_call'];
    role = json['role'];
    toolCalls = json['tool_calls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['function_call'] = functionCall;
    data['role'] = role;
    data['tool_calls'] = toolCalls;
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt_tokens'] = promptTokens;
    data['completion_tokens'] = completionTokens;
    data['total_tokens'] = totalTokens;
    return data;
  }
}
