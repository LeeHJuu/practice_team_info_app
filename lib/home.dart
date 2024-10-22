import 'package:flutter/material.dart';
import 'package:flutter_test_api/member_controller.dart';
import 'package:flutter_test_api/showing_info_pages.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 이미지, 데이터 넣기
    List<AssetImage>? thumbnailimgs = [];
    List<String>? names = ['이현주', '고성훈', '박정우', '박채은', '황상진'];

    // 이미지, 이름 초기화 함수
    thumbnailimgs = _initThumbnailimg(thumbnailimgs);
    names = _initNames(names);

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
                child: _contentsitems(thumbnailimgs, names),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _contentsitems(List<AssetImage> images, List<String> names) {
  return GridView.builder(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      mainAxisSpacing: 30,
    ),
    itemCount: 5,
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
                    image: images[index],
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
            names[index],
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      );
    },
  );
}

List<AssetImage> _initThumbnailimg(List<AssetImage> m) {
  while (m.length < 5) {
    m.add(const AssetImage('assets/images/default.png'));
  }
  return m;
}

List<String> _initNames(List<String> n) {
  while (n.length < 5) {
    n.add('홍길동');
  }
  return n;
}
