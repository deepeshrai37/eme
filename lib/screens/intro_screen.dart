import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sos/screens/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController=PageController();

  bool onLastPage= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                onLastPage=(index==2);
              });
            },
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Logo Dochome.png'),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Stack(
                         alignment: AlignmentDirectional.topStart,
                        children: [
                          Image.asset('assets/Vector 1.png'),
                          Row(
                            children: [
                              SizedBox(width: 30,),
                              Image.asset('assets/Frame (2).png'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Accidental Emergency'),
                  SizedBox(height: 20,),
                ],
                
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Logo Dochome.png'),
                  Image.asset('assets/Asset 2 1.png'),
                  Text('Medical Emergency'),
                  SizedBox(height: 20,)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Logo Dochome.png'),
                  Image.asset('assets/image 20.png'),
                  Text('Corporate Emergency'),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ],
        ),
          Container(
            alignment: Alignment(0,0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap:(){
                      _pageController.jumpToPage(2);
                      },
                      child: Text('Skip')
                  ),
                  SmoothPageIndicator(controller: _pageController, count: 3),
                  onLastPage? GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                     },
                      child: Text('Done')
                  ):
                  GestureDetector(
                      onTap: (){
                        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: Text('Next')
                  )

                ],
              )
          )
    ]
      ),
    );
  }
}
