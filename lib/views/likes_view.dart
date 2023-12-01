import 'package:flutter/material.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/components/proverb_component.dart';

class LikesView extends StatelessWidget{
  List<String> keyword = ['Keyword1','Keyword2'];
  List<Proverb> data = [];

  LikesView({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
