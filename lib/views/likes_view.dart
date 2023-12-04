import 'package:flutter/material.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/components/proverb_component.dart';
import 'package:wise_words/theme/colors.dart';

// ignore: must_be_immutable
class LikesView extends StatelessWidget {
  List<String> keyword = ['Keyword1', 'Keyword2'];
  List<Proverb> data = [];
  AvlData Avl;
  final Function(bool) onLikedChange;

  LikesView(
      {super.key,
      required this.data,
      required this.onLikedChange,
      required this.Avl});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AppColors color = AppColors();

    return Center(
      child: SizedBox(
        width: width,
        height: height - 60,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, right: 20),
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
                Flexible(
                  child: Container(
                    height:
                        height - (166 + MediaQuery.of(context).padding.bottom),
                    child: SingleChildScrollView(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 45, left: 30, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: data
                              .map(
                                (item) => Column(
                                  children: [
                                    ProverbCard(
                                      cardColor: color.getNextColor(),
                                      proverb: item,
                                      Avl: Avl,
                                      onLikedChange: onLikedChange,
                                    ),
                                    const SizedBox(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
