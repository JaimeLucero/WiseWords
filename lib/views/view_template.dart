import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/avltree/proverb.dart';
import 'package:wise_words/engines/home_generator.dart';
import 'package:wise_words/engines/likes_generator.dart';
import 'package:wise_words/views/home_view.dart';
import 'package:wise_words/views/likes_view.dart';
import 'package:wise_words/views/search_view.dart';
import 'package:wise_words/views/searchresult_view.dart';

class ViewTemplate extends StatefulWidget {
  ViewTemplate(
      {super.key,
      required this.searchResult,
      required this.query,
      required this.data,
      required this.queryList});
  bool searchResult;
  final String query;
  final AvlData data;
  List<Proverb> queryList;

  @override
  State<ViewTemplate> createState() => _ViewTemplateState();
}

class _ViewTemplateState extends State<ViewTemplate> {
  bool showHome = true;
  bool showSearch = false;
  bool showLikes = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;
    List<Proverb> proverbs = [];
    List<Proverb> likes = [];

    if (showHome) {
      GenerateHome initHome = GenerateHome(widget.data);
      proverbs = initHome.initDataList();
    }

    if (showLikes) {
      GenerateLikes initLikes = GenerateLikes(widget.data);
      likes = initLikes.initDataList();
    }

    if (widget.searchResult) {
      showHome = false;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: padding.top),
          child: Center(
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  color: const Color(0xff1E1E1E),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height -
                            (100 + MediaQuery.of(context).padding.bottom),
                        decoration: const BoxDecoration(
                          color: Color(0xffFCFCFC),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSvgButton('assets/images/home.svg',
                                  const Color(0xffFCFCFC), showHome, () {
                                // Handle tap for the first button
                                setState(() {
                                  if (!showHome) {
                                    showHome = true;
                                    showLikes = false;
                                    showSearch = false;
                                    widget.searchResult = false;
                                  }
                                });
                                print('Button 1 tapped!');
                              }),
                              const SizedBox(
                                width: 35,
                              ),
                              _buildSvgButton('assets/images/search.svg',
                                  const Color(0xffFCFCFC), showSearch, () {
                                // Handle tap for the first button
                                setState(() {
                                  if (!showSearch) {
                                    showSearch = true;
                                    showHome = false;
                                    showLikes = false;
                                    widget.searchResult = false;
                                  }
                                });
                                print('Button 2 tapped!');
                              }),
                              const SizedBox(
                                width: 35,
                              ),
                              _buildSvgButton('assets/images/heart.svg',
                                  const Color(0xffFCFCFC), showLikes, () {
                                // Handle tap for the first button
                                setState(() {
                                  if (!showLikes) {
                                    showLikes = true;
                                    showHome = false;
                                    showSearch = false;
                                    widget.searchResult = false;
                                  }
                                });
                                print('Button 3 tapped!');
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showHome) HomeView(data: proverbs, Avl: widget.data,),
                if (showLikes) LikesView(data: likes),
                if (showSearch) SearchView(data: widget.data.getDataList(), Avl: widget.data),
                if (widget.searchResult) SearchResults(query: widget.query, data: widget.queryList, Avl: widget.data,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSvgButton(
      String assetPath, Color iconColor, bool isCurrentPage, onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        assetPath,
        height: 50,
        width: 50,
        colorFilter: ColorFilter.mode(
          isCurrentPage
              ? iconColor.withOpacity(1.0)
              : iconColor.withOpacity(0.7),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
