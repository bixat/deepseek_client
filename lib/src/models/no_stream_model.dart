import 'package:deepseek/src/models/message_model.dart';

class NoSream {
  String? id;
  List<Choices>? choices;
  int? created;
  String? model;
  String? systemFingerprint;
  String? object;
  Usage? usage;

  NoSream(
      {this.id,
      this.choices,
      this.created,
      this.model,
      this.systemFingerprint,
      this.object,
      this.usage});

  NoSream.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    created = json['created'];
    model = json['model'];
    systemFingerprint = json['system_fingerprint'];
    object = json['object'];
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
    data['system_fingerprint'] = systemFingerprint;
    data['object'] = object;
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class Choices {
  String? finishReason;
  int? index;
  Message? message;
  Logprobs? logprobs;

  Choices({this.finishReason, this.index, this.message, this.logprobs});

  Choices.fromJson(Map<String, dynamic> json) {
    finishReason = json['finish_reason'];
    index = json['index'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    logprobs = json['logprobs'] != null
        ? Logprobs.fromJson(json['logprobs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['finish_reason'] = finishReason;
    data['index'] = index;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    if (logprobs != null) {
      data['logprobs'] = logprobs!.toJson();
    }
    return data;
  }
}

class Logprobs {
  List<Content>? content;

  Logprobs({this.content});

  Logprobs.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? token;
  int? logprob;
  List<int>? bytes;
  List<TopLogprobs>? topLogprobs;

  Content({this.token, this.logprob, this.bytes, this.topLogprobs});

  Content.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    logprob = json['logprob'];
    bytes = json['bytes'].cast<int>();
    if (json['top_logprobs'] != null) {
      topLogprobs = <TopLogprobs>[];
      json['top_logprobs'].forEach((v) {
        topLogprobs!.add(TopLogprobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['logprob'] = logprob;
    data['bytes'] = bytes;
    if (topLogprobs != null) {
      data['top_logprobs'] = topLogprobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopLogprobs {
  String? token;
  int? logprob;
  List<int>? bytes;

  TopLogprobs({this.token, this.logprob, this.bytes});

  TopLogprobs.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    logprob = json['logprob'];
    bytes = json['bytes'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['logprob'] = logprob;
    data['bytes'] = bytes;
    return data;
  }
}

class Usage {
  int? completionTokens;
  int? promptTokens;
  int? totalTokens;

  Usage({this.completionTokens, this.promptTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    completionTokens = json['completion_tokens'];
    promptTokens = json['prompt_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completion_tokens'] = completionTokens;
    data['prompt_tokens'] = promptTokens;
    data['total_tokens'] = totalTokens;
    return data;
  }
}
