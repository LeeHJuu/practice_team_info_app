import 'package:get/get.dart';

class MemberController extends GetxController {
  int memberindex = 0;

  static String getMemberName(int num) {
    switch (num) {
      case 1:
        return "이현주";
      case 2:
        return "고성훈";
      case 3:
        return "박정우";
      case 4:
        return "박채은";
      case 5:
        return "황상진";
      default:
        return "이름 없음";
    }
  }

  void setMember(int num) {
    memberindex = num;
  }
}
