import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final _controller = PageController();
  bool isFirst = true;
  bool isLast = false;
  bool isLottie = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isFirst = index == 0;
                isLast = index == 3;
              });
            },
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/sousvide.jpg'),
                  const Text(
                    'Ride Safely\nwith Car DoDo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/sousvide.jpg'),
                  // Lottie.asset('assets/lottie/security-car-black.json'),
                  const Text(
                    'Need To Go Somewhere?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/steam1.json'),
                  const Text(
                    'Side Income Near Your Institution?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/sousvide.jpg'),
                  const Text(
                    'CAR DODO\nis Here To Save the Day !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: isFirst
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(12),
                      child: MaterialButton(
                        padding: const EdgeInsets.all(16),
                        minWidth: 300,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        onPressed: () {
                          _controller.jumpToPage(1);
                        },
                        child: Text('get started'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF14213D))),
                      ),
                    ),
                  )
                : isLast
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          elevation: 5,
                          borderRadius: BorderRadius.circular(12),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(16),
                            minWidth: 300,
                            color: const Color.fromRGBO(252, 163, 17, 1),
                            onPressed: () async {
                              // // final prefs =
                              // //     await SharedPreferences.getInstance();
                              // // prefs.setBool('skipOnboard', true);
                              // setState(() => isLottie = true);
                              // await Future.delayed(const Duration(seconds: 4),
                              //     () {
                              //   setState(() => isLottie = false);
                              //   // Navigator.push(
                              //   //     context,
                              //   //     MaterialPageRoute(
                              //   //         builder: (context) =>
                              //   //             const WelcomePage()));
                              // });
                            },
                            child: Text('let bro cook'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF14213D))),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: 4,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.black45,
                            activeDotColor: Color(0xFF800000),
                            // dotWidth: 20,
                            dotHeight: 8,
                            radius: 16,
                          ),
                          onDotClicked: (index) {
                            _controller.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
