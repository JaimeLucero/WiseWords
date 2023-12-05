import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/views/view_template.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key, required this.data});
  final AvlData data;
  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  void initState() {
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Material(
      child: Center(
        child: GestureDetector(
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewTemplate(searchResult: false, query: "", data: widget.data, queryList: [], filter: [],)),
            );
          },
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/welcome.png',
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 260),
                  child: Column(
                    children: [
                      const Center(
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 500),
                          fadeIn: true,
                          slidingBeginOffset: Offset(0, -0.1),
                          child: Text(
                            'Wise\nWords',
                               textAlign: TextAlign.center,
                                style: TextStyle(
                                fontFamily: 'Montserrat',
                               fontSize: 48,
                               fontWeight: FontWeight.w900,
                               color: Color(0xffFCFCFC)),
                          ),
                        ),
                      ),
                      Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Inspirational proverbs for you',
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFCFCFC)),
                            ),
                          ],
                          repeatForever: false,
                          displayFullTextOnTap: true,
                          isRepeatingAnimation: false,
                        ),
                      ),
                      const SizedBox(height: 50,),
                      const Text(
                        'Tap to start',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFCFCFC)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
