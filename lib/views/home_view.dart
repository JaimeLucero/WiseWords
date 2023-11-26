import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/components/navbar_components.dart';
import 'package:wise_words/components/proverb_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> keyword = ['Keyword1','Keyword2'];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: const Color(0xff1E1E1E),
            ),
            Column(
              children: [
                Container(
                  width: width,
                  height: height - 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffFCFCFC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                const Navbar(
                  iconColor: Color(0xffFCFCFC),
                  page: 'home',
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: padding.top, left: 30, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Home',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                            color: Color(0xff1E1E1E)),
                      ),
                      SvgPicture.asset(
                        'assets/images/cog.svg',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProverbCard(
                        cardColor: Color(0xB2E50058),
                        title: 'Proverbs ##',
                        content:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                        keywords: keyword,
                        liked: false),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
