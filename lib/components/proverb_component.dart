import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/engines/related_proverbs.dart';
import 'package:wise_words/views/proverb_view.dart';

class ProverbCard extends StatelessWidget {
  const ProverbCard(
      {super.key,
      required this.cardColor,
      required this.proverb,
      required this.Avl,
      required this.onLikedChange});
  final Color cardColor;
  final Proverb proverb;
  final AvlData Avl;
  final Function(bool) onLikedChange;

  @override
  Widget build(BuildContext context) {
    RelatedProverbs initRelated = RelatedProverbs(Avl, proverb);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProverbView(
                    liked: proverb.ifLike(),
                    proverb: proverb,
                    data: initRelated.getRelated(),
                    Avl: Avl,
                    onLikedChange: onLikedChange,
                  )),
        );
        print('Proverb card tapped');
      },
      child: Container(
        width: double.infinity,
        height: null,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: cardColor,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              width: double.infinity,
              child: Text(
                'Proverbs: ${proverb.getChapter()} : ${proverb.getVerse()}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              width: double.infinity,
              child: Text(
                proverb.getFormatted(),
                style: const TextStyle(
                  color: Color(0xFFFCFCFC),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        proverb.getKeywords().isNotEmpty
                            ? proverb.getKeywords().length >= 3
                                ? '${proverb.getKeywords()[0]} | ${proverb.getKeywords()[1]} | ${proverb.getKeywords()[2]}'
                                : proverb.getKeywords().join(' | ')
                            : 'No Keywords',
                        style: const TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            bool newLikeStatus = !proverb.ifLike();
                            proverb.setLike(newLikeStatus);
                            onLikedChange(newLikeStatus);
                            await Avl.writeFile();
                            if (newLikeStatus) {
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
                            await Future.delayed(Duration(seconds: 2));
                            print(proverb.ifLike());
                          },
                          child: SvgPicture.asset(
                            'assets/images/heart.svg',
                            width: 33,
                            height: 33,
                            colorFilter: ColorFilter.mode(
                                const Color(0xffFCFCFC)
                                    .withOpacity(proverb.ifLike() ? 1.0 : 0.5),
                                BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            String textToCopy = proverb.toString();
                            FlutterClipboard.copy(textToCopy).then((value) {
                              // Clipboard content is now in the clipboard
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Text copied to clipboard'),
                                ),
                              );
                            });
                            print('shared');
                          },
                          child: SvgPicture.asset(
                            'assets/images/share.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
