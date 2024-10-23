import 'package:flutter/material.dart';
import 'package:flutter_test_api/member_controller.dart';
import 'package:flutter_test_api/member_page_hsj.dart';
import 'package:flutter_test_api/member_page_ksh.dart';
import 'package:flutter_test_api/member_page_lhj.dart';
import 'package:flutter_test_api/member_page_pce.dart';
import 'package:flutter_test_api/member_page_pjw.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';

class ShowingInfoPages extends StatefulWidget {
  ShowingInfoPages({super.key});

  @override
  State<ShowingInfoPages> createState() => _ShowingInfoPagesState();
}

class _ShowingInfoPagesState extends State<ShowingInfoPages> {
  late final MemberController memberController;
  late final PageController memberpageController;

  @override
  void initState() {
    super.initState();

    memberController = Get.find();
    // memberpageController =
    //     PageController(initialPage: memberController.memberindex);
  }

  List<Widget> memberPages = [
    MemberPageLhj(),
    MemberPageKsh(),
    MemberPagePjw(),
    MemberPagePce(),
    MemberPageHsj(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LoopPageView.builder(
          controller:
              LoopPageController(initialPage: memberController.memberindex),
          itemCount: memberPages.length,
          itemBuilder: (_, index) {
            return memberPages[index];
          },
        ),
      ),
    );
  }
}
