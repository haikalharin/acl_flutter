class FirebaseTopicResponse {
Content? content;
String? successMessage;
int? code;
String? errorMessage;

FirebaseTopicResponse(
    {this.content, this.successMessage, this.code, this.errorMessage});

FirebaseTopicResponse.fromJson(Map<String, dynamic> json) {
content =
json['content'] != null ? Content.fromJson(json['content']) : null;
successMessage = json['successMessage'];
code = json['code'];
errorMessage = json['errorMessage'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  if (content != null) {
    data['content'] = content?.toJson();
  }
  data['successMessage'] = successMessage;
  data['code'] = code;
  data['errorMessage'] = errorMessage;
  return data;
}
}

class Content {
  List<String>? allAvailableTopics;
  List<String>? userRelatedTopics;

  Content({this.allAvailableTopics, this.userRelatedTopics});

  Content.fromJson(Map<String, dynamic> json) {
    allAvailableTopics = json['allAvailableTopics'].cast<String>();
    userRelatedTopics = json['userRelatedTopics'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allAvailableTopics'] = allAvailableTopics;
    data['userRelatedTopics'] = userRelatedTopics;
    return data;
  }
}