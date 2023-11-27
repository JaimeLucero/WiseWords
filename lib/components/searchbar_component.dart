import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/views/searchresult_view.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key, required this.query});
  final query;

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
                  onTap: () {
                    print('filters');
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
                      // Call your navigation logic here
                      if (text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResults(query: text,),
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
}
