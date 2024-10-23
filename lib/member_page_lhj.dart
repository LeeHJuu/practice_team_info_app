import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MemberPageLhj extends StatelessWidget {
  MemberPageLhj({super.key});

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
                        "이현주",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24),
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
          color: const Color.fromARGB(255, 158, 197, 151),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://mir-s3-cdn-cf.behance.net/projects/404/54ed5829649575.55fcf076e31d0.jpg"),
              const Text(
                "사실 저는 잠만보입니다",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  "하루에 12시간 자야해요.. 하지만 현실을 살아가기엔 어쩔 수 없이 타협해야 하는 수면시간 ㅠ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          )),
    );
  }

  Widget SecondScreen() {
    return SizedBox.expand(
      child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://i.pinimg.com/236x/a4/88/6e/a4886e4cde1362ab0bcd4512b4227141.jpg"),
              const Text(
                "또, 저는 메타몽입니다",
                style: TextStyle(
                    color: Color.fromARGB(255, 158, 103, 158),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  "친구가 저는 잠만보보다는\n메타몽을 닮았대요.\n\n귀여워서 맘에들어요.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 158, 103, 158),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }

  Widget ThirdScreen() {
    return SizedBox.expand(
      child: Container(
        color: const Color.fromARGB(255, 92, 156, 49),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPiCrKSPaXJGt1DduxqO3IQ8tDoWF-zP1F0w&s",
              fit: BoxFit.fill,
            ),
            Container(
                color: const Color.fromRGBO(0, 0, 0, 0.281),
                // alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 70,),
                    Text(
                      "굉장해 나 굉장한 메타몽이야!!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "메타몽은 이것도 되고 저것도 되니까 어떻게 보면 올라운더라고 볼 수도 있지 않나요?\n훌륭한 메타몽이 되어보겟습니다",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget FourthScreen() {
    return SizedBox.expand(
      child: Container(
        color: const Color.fromARGB(255, 126, 126, 126),
        child: const Center(
          child: Text(
            '끝.\n한번 더 누르면 처음으로 돌아가욤',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
