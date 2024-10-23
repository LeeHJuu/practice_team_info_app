import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MemberPagePjw extends StatelessWidget {
  MemberPagePjw({super.key});

  @override
  Widget build(BuildContext context) {
    // check:: 여기에 보여줄 페이지들 목록 집어넣기.
    return _infoPageWidget([
      FirstScreen(),
      SecondScreen(),
      ThirdScreen(),
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
                  onTapUp: (details) {
                    if (details.localPosition.dx > (constraints.maxWidth/2)){
                      int nextPage = _pageController.page!.toInt() + 1;
                      if (nextPage < myInfoPages.length) {
                        _pageController.animateToPage(
                          nextPage,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                    if (details.localPosition.dx < (constraints.maxWidth/2)){
                      int nextPage = _pageController.page!.toInt() - 1;
                      if (nextPage < myInfoPages.length) {
                        _pageController.animateToPage(
                          nextPage,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                        );
                      }
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
                        "박정우",
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
        color: const Color(0xff5C786E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Flexible(
              child: Text(
                "스몰 e의 시큼한 대학교 화석", 
                style: TextStyle(
                  color: Color(0xff553F33),
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

             Flexible(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 20,
                  left: 20),
                child: const Text(
                  ": 나에대한 3가지",
                  style: TextStyle(
                    color: Color(0xff553F33),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                )
              )
            ),

            Flexible(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 20,
                  left: 20),
                child: const Text(
                  "1. 여행과 수영이라면 이번 프로젝트도 스무스~ 같이 수영하러 갈래요?",
                  style: TextStyle(
                    color: Color(0xff553F33),
                    fontSize: 20,
                  ),
                )
              )
            ),

            Flexible(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 20,
                  left: 20),
                child: const Text(
                  "2.부산 사람이라 그런지 바다를 많이 닮았다고 들었습니다",
                  style: TextStyle(
                    color: Color(0xff553F33),
                    fontSize: 20,
                  ),
                )
              )
            ),

            Flexible(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 20,
                  left: 20),
                child: const Text(
                  "3. 제일 좋아하는 음식은 산딸기.. 맛있어.. 상큼한게 최고야",
                  style: TextStyle(
                    color: Color(0xff553F33),
                    fontSize: 20,
                  ),
                )
              )
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
            image: AssetImage('assets/images/JWPswim.jpg'),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}

  Widget ThirdScreen() {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/JWPAB.jpg'),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
