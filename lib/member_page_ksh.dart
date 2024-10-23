import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MemberPageKsh extends StatelessWidget {
  MemberPageKsh({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pagelist = [
      FirstScreen(),
      SecondScreen(),
      ThirdScreen(),
      FourthScreen(),
    ];

    // check:: 여기에 보여줄 페이지들 목록 집어넣기.
    return _infoPageWidget(pagelist);
  }

  final PageController _pageController = PageController();

  Widget _infoPageWidget(List<Widget> myInfoPages) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          // check:: 배경화면 컬러 지정
          backgroundColor: Colors.black,
          body: SafeArea(
              child: Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    int nextPage = _pageController.page!.toInt() + 1;
                    if (nextPage < myInfoPages.length) {
                      _pageController.animateToPage(
                        nextPage,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    }
                    else {
                      nextPage = 0;
                      _pageController.animateToPage(
                        nextPage,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        // height: 750,
                        height: constraints.maxHeight - 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            // pageSnapping: false,
                            scrollDirection: Axis.vertical,
                            children: myInfoPages,
                          ),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: myInfoPages.length,
                        effect: const ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          activeDotColor: Colors.grey,
                        ), // your preferred effect
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        // Todo:: 멤버 인덱스 받아 이름 자동화 하기
                        "고성훈",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )
                    ],
                  )),
              Positioned(
                  top: 30,
                  left: 35,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text('X',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  )),
            ],
          )),
        );
      },
    );
  }

  // check:: 여기 아래로 Widget 만들어 페이지 생성.
  // check:: 여기 아래로 Widget 만들어 페이지 생성.

  Widget FirstScreen() {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ksh1.jpg'), // 배경 이미지 경로
            fit: BoxFit.cover, // 이미지 크기 조정 방식
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // 세로축에서 아래쪽에 정렬
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 200), // 아래에 여백 추가
              child: Text(
                '1조 고성훈을 소개합니다.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SecondScreen() {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ksh2.jpg'), // 배경 이미지 경로
            fit: BoxFit.cover, // 이미지 크기 조정 방식
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // 세로축에서 아래쪽에 정렬
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 200), // 아래에 여백 추가
              child: Text(
                '나이 : 꽃을 좋아하는 나이;;',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ThirdScreen() {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ksh3.jpg'), // 배경 이미지 경로
            fit: BoxFit.cover, // 이미지 크기 조정 방식
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // 세로축에서 아래쪽에 정렬
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 200), // 아래에 여백 추가
              child: Text(
                '취미 : 공원 산책을 좋아해요.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FourthScreen() {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ksh4.jpg'), // 배경 이미지 경로
            fit: BoxFit.cover, // 이미지 크기 조정 방식
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // 세로축에서 아래쪽에 정렬
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 200), // 아래에 여백 추가
              child: Text(
                '앞으로의 계획 : 쉬엄쉬엄 천천히 가자!!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
