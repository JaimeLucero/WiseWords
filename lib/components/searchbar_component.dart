import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/engines/search_engine.dart';
import 'package:wise_words/views/filters_view.dart';
import 'package:wise_words/views/view_template.dart';

class Searchbar extends StatelessWidget {
  Searchbar(
      {super.key, required this.query, required this.data, required this.Avl});
  final String query;
  final List<Proverb> data;
  final AvlData Avl;
  List<int> filter = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    TextEditingController _textController = TextEditingController();
    _textController.text = query;

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              color: const Color(0xffD9D9D9).withOpacity(0.4),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    filter = await _filtersView(context);
                    print('filters ${filter.toList()}');
                  },
                  child: SvgPicture.asset(
                    'assets/images/filter.svg',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: width - 110,
                  height: 40,
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (text) {
                      SearchEngine search = SearchEngine(
                        text,
                        Avl,
                        filter,
                      );
                      // Call your navigation logic here
                      if (text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewTemplate(
                              searchResult: true,
                              query: text,
                              queryList: search.getResults(),
                              data: Avl,
                            ),
                          ),
                        );
                      }
                    },
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  'assets/images/magnify.svg',
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<int>> _filtersView(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    List<int> filter = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FiltersView()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    return filter;
  }
}
