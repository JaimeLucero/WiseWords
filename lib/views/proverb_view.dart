import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/components/proverb_component.dart';

class ProverbView extends StatefulWidget {
  const ProverbView({super.key, required this.liked});
  final bool liked;
  @override
  State<ProverbView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<ProverbView> {
  List<String> keyword = ['Keyword1','Keyword2'];

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFCFCFC),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: padding.top),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/images/back.svg'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Proverbs ##',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Color(0xff1E1E1E)),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
              width: double.infinity,
              height: null,
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, top: 20),
              width: double.infinity,
              child: const Text(
                'Keywords:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Keyword 1 | Keyword 2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      print('liked');
                    },
                    child: SvgPicture.asset(
                      'assets/images/heart.svg',
                      width: 33,
                      height: 33,
                      colorFilter: ColorFilter.mode(
                          const Color(0xff1E1E1E)
                              .withOpacity(widget.liked ? 1.0 : 0.7),
                          BlendMode.srcIn),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('shared');
                    },
                    child: SvgPicture.asset(
                      'assets/images/share.svg',
                      colorFilter: const ColorFilter.mode(
                          Color(0xff1E1E1E),
                          BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 50, top: 35),
              child: const Text(
                  'Related Proverbs:',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      height: 0,
                  ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProverbCard(
                      cardColor: const Color(0xB2E50058),
                      title: 'Proverbs ##',
                      content:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                      keywords: keyword,
                      liked: false),
                    const SizedBox(height: 10,),
                    ProverbCard(
                      cardColor: const Color(0xB2E50058),
                      title: 'Proverbs ##',
                      content:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                      keywords: keyword,
                      liked: false),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
