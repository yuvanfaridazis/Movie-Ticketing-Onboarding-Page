import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  PageController pageController = PageController();
  int pageIndex = 0;
  String buttonText = 'Next Slide';


  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {

    if(pageIndex == 2){
      buttonText = "Get Started";
    } else {
      buttonText = 'Next Slide';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 140, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 400,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index){
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  children: [
                    introCard("Favourite Movie", "Feel the easy experience of getting \nthe latest movie tickets in just one click", "assets/img_intro_1.png"),
                    introCard("Snack Order", "Don't worry about starving when you watching the movie, let’s order some snacks in-app", "assets/img_intro_2.png"),
                    introCard("Trailer Play", "Confused about choosing a movie? \nSo let's watch the trailer in-app firstly", "assets/img_intro_3.png"),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DotsIndicator(
                    dotsCount: 3,
                    position: pageIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: "A345D0".toColor(),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: (){

                      if(pageIndex >= 2){
                        setState(() {
                          pageIndex = 0;
                          pageController.jumpToPage(pageIndex);
                        });
                      } else {
                        setState(() {
                          pageIndex++;
                          pageController.jumpToPage(pageIndex);
                        });
                      }


                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 2*35,
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: "A345D0".toColor(),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(buttonText, style: GoogleFonts.poppins().copyWith(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18), textAlign: TextAlign.center,),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget introCard(String title, String subtitle, String imagePath){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath)
                )
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 220,
            child: Text(title, style: GoogleFonts.poppins().copyWith(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 10),
          Container(
            width: 350,
            child: Text(subtitle, style: GoogleFonts.poppins().copyWith(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15, height: 1.7), textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
