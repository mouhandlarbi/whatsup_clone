class Chat {
  String fromUserID;
  String toUserID;
  String lastMessage;
  bool lastMessageReaded;
  String toUserName;
  String toUserEmail;
  String toUserImage;

  Chat(
    this.fromUserID,
    this.toUserID,
    this.lastMessage,
    this.lastMessageReaded,
    this.toUserName,
    this.toUserEmail,
    this.toUserImage,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> mapChat = {
      "fromUserID": fromUserID,
      "toUserID": toUserID,
      "lastMessage": lastMessage,
      "lastMessageReaded": lastMessageReaded,
      "toUserName": toUserName,
      "toUserEmail": toUserEmail,
      "toUserImage": toUserImage,
    };
    return mapChat;
  }
}
