import 'package:flutter/material.dart';
import 'package:wise_words/components/searchbar_component.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key, required this.data, this.Avl});
  final data;
  final Avl;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: width,
        height: height - 60,
        child: Column(
          children: [
            Searchbar(
              query: '',
              data: data,
              Avl: Avl,
            ),
          ],
        ),
      ),
    );
  }
}
