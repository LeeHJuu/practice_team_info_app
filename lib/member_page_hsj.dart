import 'package:flutter/material.dart';
import 'package:flutter_test_api/musicmodel.dart';
import 'package:flutter_test_api/requsetmodel.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MemberPageHsj extends StatefulWidget {
  MemberPageHsj({super.key});

  @override
  State<MemberPageHsj> createState() => _MemberPageHsjState();
}

class _MemberPageHsjState extends State<MemberPageHsj> {
  final List<MusicModel> _playlist = [
    MusicModel(
        title: '붉은 장미',
        singer: '우예린',
        image: AssetImage('assets/images/music1.png')),
    MusicModel(
        title: '신호등',
        singer: '이무진',
        image: AssetImage('assets/images/music2.png')),
    MusicModel(
        title: 'Lemon',
        singer: '요네즈 켄시',
        image: AssetImage('assets/images/music3.png')),
    MusicModel(
        title: '언제나',
        singer: '허각',
        image: AssetImage('assets/images/music4.png')),
    MusicModel(
        title: '네모의 꿈',
        singer: '유영석',
        image: AssetImage('assets/images/music5.png')),
    MusicModel(
        title: '여행',
        singer: '볼빨간 사춘기',
        image: AssetImage('assets/images/music6.png')),
    MusicModel(
        title: 'Brave Heart',
        singer: '전영호',
        image: AssetImage('assets/images/music7.png')),
    MusicModel(
        title: '정말로 사랑한다면',
        singer: '버스커 버스커',
        image: AssetImage('assets/images/music8.png')),
    MusicModel(
        title: 'Never Ending Story',
        singer: '부활',
        image: AssetImage('assets/images/music9.png')),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pagelist = [
      FirstScreen(),
      SecondScreen(),
      ThirdScreen(),
      //FourthScreen(),
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
                        "황상진",
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
  Widget FirstScreen() {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 100, 33),
          image: DecorationImage(
            image: AssetImage('assets/images/bluebird.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-0.16, 0),
          ),
        ),
      ),
    );
  }

  Widget SecondScreen() {
    return SizedBox.expand(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 107, 64, 83),
              const Color.fromARGB(255, 15, 15, 15)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  '아무곡 모음집',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(
                        'assets/images/hsj1.png',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '황상진',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.expand_circle_down_outlined,
                      color: Color(0xff999999),
                      size: 40,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.person_add_alt_1_outlined,
                      color: Color(0xff999999),
                      size: 40,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.menu,
                      color: Color(0xff999999),
                      size: 40,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        _playlist.length,
                        (index) {
                          return playlist_container(index);
                        },
                      )
                    ],
                  ),
                )),
              ],
            ),
            Positioned(
              right: 0,
              top: 150,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container playlist_container(int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: _playlist[index].image,
            width: 50,
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _playlist[index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  _playlist[index].singer,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage(
              'assets/images/hsj1.png',
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 24,
          )
        ],
      ),
    );
  }

  final List<RequestModel> _requsetlist = [
    RequestModel(question: '혈액형은?', anser: 'B형', index: 0, clickflag: true),
    RequestModel(question: '봄 vs 여름 vs 가을 vs 겨울', anser: '가을', index: 1),
    RequestModel(question: '좋아하는 숫자는?', anser: '37', index: 2),
    RequestModel(question: '좋아하는 색깔은?', anser: '연하늘색', index: 3),
    RequestModel(question: '좋아하는 스포츠는?', anser: '야구', index: 4),
    RequestModel(question: '숲 vs 바다', anser: '집', index: 5),
    RequestModel(question: '좋아하는 음식은?', anser: '닭갈비,뼈해장국,스시,비빔밥,스파게티', index: 6),
    RequestModel(question: '좋아하는 게임장르는?', anser: '시뮬레이션게임,TCG게임', index: 7),
    RequestModel(question: '요새 취미는?', anser: '웹소설읽기,모바일게임', index: 8),
    RequestModel(question: '자주쓰는닉네임은?', anser: 'Hamiric', index: 9),
    RequestModel(question: '좋아하는 과일은?', anser: '과즙이 풍부한 과일류 모두', index: 10),
    RequestModel(question: '좋아하는 라면은?', anser: '농심 신라면', index: 11),
    RequestModel(question: '탕수육 부먹 vs 찍먹', anser: '찍먹', index: 12),
    RequestModel(question: '에어컨 없는 여름 vs 난방 없는 겨울', anser: '에어컨 없는건 버텨도, 난방 없는건 못 버팀', index: 13),
    RequestModel(question: '좋아하는 음악은?', anser: '흥겨운 음악', index: 14),
    RequestModel(question: '언젠가 한번 해보고싶은것은?', anser: '게임만들기,소설쓰기', index: 15),
    RequestModel(question: '가장좋아하는(했던) TV프로그램은?', anser: '런닝맨', index: 16),
    RequestModel(question: '기억에 남는 명언?', anser: '언제나 현재에 집중할수 있다면 행복할것이다. -파울로 코엘료', index: 17),
    RequestModel(question: '쉴때 하는 일은?', anser: '잠자기,유튜브보기', index: 18),
    RequestModel(question: '앞으로 한마디', anser: '끝까지 힘내자!', index: 19),
  ];

  String question = '혈액형은?';
  String anser = 'B형';
  int flagnum = 0;

  Widget ThirdScreen() {
    return SizedBox.expand(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                '20문 20답',
                style: TextStyle(fontSize: 48, color: Colors.black),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 100,
                child: Text(
                  textAlign: TextAlign.center,
                  question,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 80,
                child: Text(
                  anser,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  )),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(_requsetlist.length, (index) {
                          return questionNumber(index);
                        })
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Container questionNumber(int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (flagnum != index) {
              _requsetlist[flagnum].clickflag = false;
              _requsetlist[index].clickflag = true;
              flagnum = index;

              question = _requsetlist[index].question;
              anser = _requsetlist[index].anser;
            }
          });
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
                  _requsetlist[index].clickflag ? Colors.green : Colors.grey),
          child: Center(
            child: Text(
              (_requsetlist[index].index + 1).toString(),
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget FourthScreen() {
    return SizedBox.expand(
      child: Container(
        color: const Color.fromARGB(255, 92, 156, 49),
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
