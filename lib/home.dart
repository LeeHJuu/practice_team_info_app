import 'package:flutter/material.dart';
import 'package:flutter_test_api/member_controller.dart';
import 'package:flutter_test_api/membermodel.dart';
import 'package:flutter_test_api/showing_info_pages.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    List<Membermodel> members = [
      Membermodel(name: '이현주', thumbnailimg: AssetImage('assets/images/default.png')),
      Membermodel(name: '고성훈', thumbnailimg: AssetImage('assets/images/default.png')),
      Membermodel(name: '박정우', thumbnailimg: AssetImage('assets/images/default.png')),
      Membermodel(name: '박채은', thumbnailimg: AssetImage('assets/images/default.png')),
      Membermodel(name: '황상진', thumbnailimg: AssetImage('assets/images/bluebird.png')),
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Icon(
                Icons.person,
                size: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  '1조가 어떤지 물으신다면\n대답해 드리는게 인지상정',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: _contentsitems(members),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _contentsitems(List<Membermodel> members) {
  return GridView.builder(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      mainAxisSpacing: 30,
    ),
    itemCount: members.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // MemberController를 통해 항목 index 넘겨주고 있음
                Get.find<MemberController>().setMember(index);
                Get.to(ShowingInfoPages());
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: members[index].thumbnailimg,
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            members[index].name,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      );
    },
  );
}
