import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Center(child: Text("Тоглох заавар")),),
        body: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                if (index == 4) {
                  isLastPage = true;
                } else {
                  isLastPage = false;
                }
              });
            },
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.indigo,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "lib/assets/onBoardImages/level1-1.PNG",
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.6,
                        ),
                        Expanded(child: AutoSizeText("Энэ бүлэг нь 15-н үетэй. Асуултыг уншаад үг бүтээж хариултыг олно.",maxLines: 6,)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Image.asset(
                        "lib/assets/onBoardImages/level1.PNG",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.6,
                      ),Expanded(child: AutoSizeText("Сонгосон хариулт үгийн санд байвал зургаар илэрхийлэгдэнэ.",maxLines: 6,)),
                    ]),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.indigo,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "lib/assets/onBoardImages/level2.PNG",
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.6,
                        ),
                        Expanded(child: AutoSizeText("Энэ бүлэг нь 30-н үетэй. Асуултыг уншаад 4-н зурагнаас зөвийг олно.",maxLines: 6,)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Image.asset(
                        "lib/assets/onBoardImages/level4.PNG",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.6,
                      ),Expanded(child: AutoSizeText("Энэ үе нь 30-н үетэй бөгөөд зургийн харан өгөгдсөн үгээр өгүүлбэр зохионо.",maxLines: 6,)),
                    ]),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.indigo,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "lib/assets/onBoardImages/level3.PNG",
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.6,
                        ),
                        Expanded(child: AutoSizeText("Энэ бүлэг нь 30-н үетэй. Өгөгдсөн 3-н мэдээллээр амьтныг таах ёстой.",maxLines: 6,)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Image.asset(
                        "lib/assets/onBoardImages/level3-1.PNG",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.6,
                      ),Expanded(child: AutoSizeText("Зөв тааж чадвал, амьтны зургийг харах боломжтой болно.",maxLines: 6,)),
                    ]),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.indigo,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset(
                          "lib/assets/onBoardImages/level5.PNG",
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.3,
                        ),SizedBox(height: 10,),
                        Image.asset(
                          "lib/assets/onBoardImages/level5-1.PNG",
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.3,
                        ),
                        Expanded(child: AutoSizeText("Цагийг эхлүүлээд өгөгдсөн хугацаанд эхийг уншина.",maxLines: 6,)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      SizedBox(height: 10,),
                      Image.asset(
                        "lib/assets/onBoardImages/level5-2.PNG",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.3,
                      ),SizedBox(height: 10,),Image.asset(
                        "lib/assets/onBoardImages/level5-3.PNG",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.3,
                      ),Expanded(child: AutoSizeText("Цаг дууссаны дараа хамгийн сүүлд уншсан үг дээр удаан дарж тоог харна.",maxLines: 6,)),
                    ]),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.indigo,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "lib/assets/onBoardImages/dialogwin.PNG",
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.6,
                        ),
                        Expanded(child: AutoSizeText("Үе бүрийг давахад гарч ирнэ.",maxLines: 6,)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Image.asset(
                        "lib/assets/onBoardImages/dialoglose.PNG",
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.6,
                      ),Expanded(child: AutoSizeText("Үе бүрт хожигдоход гарч ирнэ..",maxLines: 6,)),
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 80,
          child: !isLastPage
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.jumpToPage(5);
                        },
                        child: Text('SKIP')),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 5,
                        effect: WormEffect(
                          dotHeight: 16,
                          dotWidth: 16,
                          type: WormType.thin,
                          // strokeWidth: 5,
                        ),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Text('NEXT')),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 80,
                    child: Center(
                      child: Text(
                        "Эхлэх",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ),
                ),
        ));
  }
}
