import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/components/proverb_component.dart';
import 'package:wise_words/theme/colors.dart';

class ProverbView extends StatefulWidget {
  const ProverbView(
      {super.key,
      required this.liked,
      required this.proverb,
      required this.data,
      required this.Avl,
      required this.onLikedChange});
  final bool liked;
  final Proverb proverb;
  final List<Proverb> data;
  final AvlData Avl;
  final Function(bool) onLikedChange;

  @override
  State<ProverbView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<ProverbView> {

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    var height = MediaQuery.of(context).size.height;
    AppColors color = AppColors();

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
                  Text(
                    'Proverbs ${widget.proverb.getChapter()} : ${widget.proverb.getVerse()}',
                    style: const TextStyle(
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
              child: Text(
                '${widget.proverb.getFormatted()}',
                textAlign: TextAlign.justify,
                style: const TextStyle(
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
                  Container(
                    width: 200,
                    child: Text(
                      widget.proverb.getKeywords().join(' | '),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          bool newLikeStatus = !widget.proverb.ifLike();
                          widget.proverb.setLike(newLikeStatus);
                          widget.onLikedChange(newLikeStatus);
                          await widget.Avl.writeFile();
                          if(newLikeStatus) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Proverb added to likes.'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Proverb removed from likes.'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                          print(widget.proverb.ifLike());
                        },
                        child: SvgPicture.asset(
                          'assets/images/heart.svg',
                          width: 33,
                          height: 33,
                          colorFilter: ColorFilter.mode(
                              const Color(0xff1E1E1E)
                                  .withOpacity(widget.proverb.ifLike() ? 1.0 : 0.5),
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
                              Color(0xff1E1E1E), BlendMode.srcIn),
                        ),
                      ),
                    ],
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
            Container(
              height: height - MediaQuery.of(context).padding.bottom - 330,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.data
                        .map(
                          (item) => Column(
                            children: [
                              ProverbCard(
                                cardColor: color.getNextColor(),
                                proverb: item,
                                Avl:widget.Avl,
                                onLikedChange: widget.onLikedChange,
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
      ),
    );
  }
}
