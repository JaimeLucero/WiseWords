import 'package:flutter/material.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/components/proverb_component.dart';
import 'package:wise_words/components/searchbar_component.dart';

class SearchResults extends StatelessWidget {
  List<String> keyword = ['Keyword1', 'Keyword2'];

  SearchResults(
      {super.key, required this.query, required this.data, required this.Avl, required this.chapter,required this.verse, required this.onLikedChange});
  final String query;
  final List<Proverb> data;
  final AvlData Avl;
  final int chapter;
  final int verse;
  final Function(bool) onLikedChange;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Container(
      width: width,
      height: height - 60,
      child: Column(
        children: [
          Searchbar(
            query: query,
            data: data,
            Avl: Avl,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  'Chapter: $chapter',
                  style: const TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  'Verse: $verse',
                  style: const TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: height - MediaQuery.of(context).padding.bottom - 210,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data
                      .map(
                        (item) => Column(
                          children: [
                            ProverbCard(
                              cardColor: const Color(0xB2E50058),
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
        ],
      ),
    );
  }
}
