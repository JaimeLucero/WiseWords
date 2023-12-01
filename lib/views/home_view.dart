import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/components/proverb_component.dart';
import 'package:wise_words/engines/likes_generator.dart';
import 'package:wise_words/views/settings_view.dart';

class HomeView extends StatelessWidget {
  List<Proverb> data = [];
  AvlData Avl;
  Function(bool) onLikedChange;
  GenerateLikes likes;

  HomeView(
      {super.key,
      required this.data,
      required this.Avl,
      required this.onLikedChange,
      required this.likes});
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
                                    builder: (context) => SettingsView(likes: likes, Avl: Avl,)),
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
                      height:
                          height - MediaQuery.of(context).padding.bottom - 145,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 45, left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: data
                                .map(
                                  (item) => Column(
                                    children: [
                                      ProverbCard(
                                        cardColor: Color(0xB2E50058),
                                        proverb: item,
                                        Avl: Avl,
                                        onLikedChange: onLikedChange,
                                      ),
                                      SizedBox(
                                          height:
                                              16), // Adjust the height based on your preference
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
