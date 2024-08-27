class ChatModel {
  String timestamp, profilePic;
  String? photo,message;
  bool isSender;
  ChatModel({required this.isSender,  this.message, required this.profilePic, required this.timestamp,this.photo});
}
