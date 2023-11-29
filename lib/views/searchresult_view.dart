import 'package:flutter/material.dart';
import 'package:wise_words/components/proverb_component.dart';
import 'package:wise_words/components/searchbar_component.dart';

class SearchResults extends StatelessWidget {
  List<String> keyword = ['Keyword1', 'Keyword2'];

  SearchResults({super.key, required this.query});
  final query;

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
          Searchbar(query: query),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: const Text(
                  'Chapter: #',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Verse: #',
                  style: TextStyle(
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
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
    );
  }
}
