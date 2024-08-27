class FeedsDataModel {
  String name, time, topic, content,profilePic;
  String? pic;

  FeedsDataModel(
      {required this.content,
      required this.name,
      this.pic,
      required this.time,
      required this.topic,required this.profilePic});
}
