import 'package:flutter/material.dart';
import 'package:wise_words/components/proverb_component.dart';

class LikesView extends StatelessWidget{
  List<String> keyword = ['Keyword1','Keyword2'];

  LikesView({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Center(
      child: SizedBox(
        width: width,
        height: height - 60,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: padding.top, left: 30, right: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Likes',
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
