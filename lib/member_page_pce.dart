import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MemberPagePce extends StatelessWidget {
  MemberPagePce({super.key});

  @override
  Widget build(BuildContext context) {
    // check:: 여기에 보여줄 페이지들 목록 집어넣기.
    return _infoPageWidget([
      FirstScreen(),
      SecondScreen(),
      ThirdScreen(),
      FourthScreen(),
    ]);
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
                    } else {
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
                        "박채은",
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
              image: AssetImage('assets/images/pce1.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 350, 0, 0),
            child: const Text(
              "잼민이 시바견을 키우고있습니다",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget SecondScreen() {
    return SizedBox.expand(
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Page index : 1',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget ThirdScreen() {
    return SizedBox.expand(
      child: Container(
        color: const Color.fromARGB(255, 92, 156, 49),
        child: const Center(
          child: Text(
            'Page index : 2',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget FourthScreen() {
    return SizedBox.expand(
      child: Container(
        color: const Color.fromARGB(255, 243, 100, 33),
        child: const Center(
          child: Text(
            'Page index : 3',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
