import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProverbCard extends StatelessWidget {
  const ProverbCard(
      {super.key,
      required this.cardColor,
      required this.title,
      required this.content,
      required this.keywords,
      required this.liked});
  final Color cardColor;
  final String title;
  final String content;
  final List<String> keywords;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: null,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: cardColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16,),
          Container(
            padding: const EdgeInsets.only(left: 25),
            width: double.infinity,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            width: double.infinity,
            child: Text(
              content,
              style: const TextStyle(
                color: Color(0xFFFCFCFC),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    keywords[0] + ' | ' + keywords[1],
                    style: const TextStyle(
                      color: Color(0xFFFCFCFC),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('liked');
                    },
                    child: SvgPicture.asset(
                      'assets/images/heart.svg',
                      width: 33,
                      height: 33,
                      colorFilter: ColorFilter.mode(
                          const Color(0xffFCFCFC).withOpacity(liked ? 1.0 : 0.7),
                          BlendMode.srcIn),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('shared');
                    },
                    child: SvgPicture.asset(
                      'assets/images/share.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16,)
        ],
      ),
    );
  }
}
