import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/components/proverb_component.dart';
import 'package:wise_words/views/settings_view.dart';

class HomeView extends StatelessWidget {
  List<String> keyword = ['Keyword1', 'Keyword2'];

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: width,
        height: height - 60,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsView()),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/images/cog.svg',
                          height: 39,
                          width: 39,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ProverbCard(
                          cardColor: const Color(0xB2E50058),
                          title: 'Proverbs ##',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                          keywords: keyword,
                          liked: false),
                    ]),
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
