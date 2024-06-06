import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sous_v/components/alarm_provider.dart';
import 'package:sous_v/components/select_alarm_popup.dart';
import 'package:sous_v/screens/homepage.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({super.key});

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  final _controller = PageController();
  bool isFirst = true;
  bool isLast = false;
  bool isLottie = false;
  late AlarmProvider reader;
  @override
  void initState() {
    super.initState();
    reader = context.read<AlarmProvider>();
    reader.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isFirst ? Colors.blueGrey : Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isFirst = index == 0;
                isLast = index == 4;
              });
            },
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset('assets/images/sousvide.jpg')),
                ],
              ),
              // STEP 1
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset('assets/images/meat.png')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          'Step 1:\nPrepare beef meat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'May season or marinade according to your preferences',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // STEP 2
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset('assets/images/sealed-meat.png')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          'Step 2:\nPlace meat inside ziplock plastic',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Remove air by pressing the plastic while sealing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // STEP 3
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Lottie.asset('assets/lottie/steam1.json')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          'Step 3: Submerge the bag inside the pot at selected temperature',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Temperature must be consistent until cooking is done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // STEP 4 = final
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Lottie.asset('assets/lottie/alarm.json')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Step 4: Set timer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
          isLast
              ? SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(const HomePage(
                            index: 0,
                            isLoading: false,
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Exit Cooking Steps',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
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
                            color: Colors.green,
                            onPressed: showAlarmOption,
                            child: Text('select cooking method'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: 5,
                          effect: const ExpandingDotsEffect(
                            dotColor: Colors.black45,
                            activeDotColor: Color(0xFF14213D),
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

  Future showAlarmOption() async {
    SelectAlarmPopup.pickMethod(context, reader);
  }
}
