import 'package:flutter/material.dart';
import 'package:flutter_test_api/member_controller.dart';
import 'package:flutter_test_api/member_page_hsj.dart';
import 'package:flutter_test_api/member_page_ksh.dart';
import 'package:flutter_test_api/member_page_lhj.dart';
import 'package:flutter_test_api/member_page_pce.dart';
import 'package:flutter_test_api/member_page_pjw.dart';
import 'package:get/get.dart';

class ShowingInfoPages extends StatelessWidget {
  ShowingInfoPages({super.key});

  final MemberController memberController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // child: GestureDetector(
        //   onPanEnd: _nextMemberPage,
        //   child: MemberPageLhj(),
        // )
        child: PageView(
          children: [
            MemberPageLhj(),
            MemberPageHsj(),
            MemberPageKsh(),
            MemberPagePce(),
            MemberPagePjw(),
          ],
        ),
      ),
    );
  }


  void _nextMemberPage(DragEndDetails details) {
    Get.to(ShowingInfoPages());
  }
}
