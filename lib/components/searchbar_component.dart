import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/engines/search_engine.dart';
import 'package:wise_words/views/filters_view.dart';
import 'package:wise_words/views/view_template.dart';

// ignore: must_be_immutable
class Searchbar extends StatelessWidget {
  Searchbar(
      {super.key, required this.query, required this.data, required this.Avl});
  final String query;
  final List<Proverb> data;
  final AvlData Avl;
  static List<int> filter = [0,0];

  final TextEditingController _textController = TextEditingController();

    Future<List<int>> _filtersView(BuildContext context) async {
      List<int> filter = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FiltersView()),
      );

      return filter;
    }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                        if (filter[0] != 0 || filter[1] != 0 || text != '') {
                           SearchEngine search = SearchEngine(
                              text,
                              Avl,
                              filter,
                            );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewTemplate(
                                searchResult: true,
                                query: text,
                                queryList: search.getResults(),
                                data: Avl,
                                filter: filter,
                              ),
                            ),
                          );
                          _textController.clear();
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
}
