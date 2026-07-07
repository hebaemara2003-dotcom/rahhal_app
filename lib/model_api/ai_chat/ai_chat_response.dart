/// status : "success"
/// message : null
/// data : "Hello 👋\nI'm Rahhal, your smart tourism assistant for exploring Egypt 🇪🇬.\nHow can I help you today?"

class AiChatResponse {
  AiChatResponse({
      this.status, 
      this.message, 
      this.data,});

  AiChatResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
  String? status;
  dynamic message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}