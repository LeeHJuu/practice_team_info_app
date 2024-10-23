class RequestModel {
  String question;
  String anser;
  late int index;
  bool clickflag;

  RequestModel({
    required this.question,
    required this.anser,
    required this.index,
    this.clickflag = false,
  });

}
