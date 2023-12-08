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

// ignore: must_be_immutable
class ViewTemplate extends StatefulWidget {
  ViewTemplate(
      {super.key,
      required this.searchResult,
      required this.query,
      required this.data,
      required this.queryList,
      required this.filter});
  bool searchResult;
  final String query;
  final AvlData data;
  List<Proverb> queryList;
  List<int> filter;

  @override
  State<ViewTemplate> createState() => _ViewTemplateState();
}

class _ViewTemplateState extends State<ViewTemplate> {
  bool showHome = true;
  bool showSearch = false;
  bool showLikes = false;
  bool isLiked = false;
  List<Proverb> proverbs = [];
  List<Proverb> likes = [];
  late GenerateHome initHome;
  late GenerateLikes initLikes;

  @override
  void initState() {
    super.initState();
    initHome = GenerateHome(widget.data); // Initialize here
    proverbs = initHome.initDataList();
    initLikes = GenerateLikes(widget.data);
    likes = initLikes.initDataList();
  }

  void initLikesList() {
    initLikes = GenerateLikes(widget.data);
    likes = initLikes.initDataList();
  }

  void handleLikeChanged(bool newLikeStatus) {
    setState(() {
      isLiked = newLikeStatus;
    });
    // You can perform additional actions based on the new like status
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;

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
                                  if (!showHome) {
                                    setState(() {
                                      showHome = true;
                                    showLikes = false;
                                    showSearch = false;
                                    widget.searchResult = false;
                                    handleLikeChanged;
                                    });
                                  };
                                print('Button 1 tapped!');
                              }),
                              const SizedBox(
                                width: 35,
                              ),
                              _buildSvgButton('assets/images/search.svg',
                                  const Color(0xffFCFCFC), showSearch, () {
                                // Handle tap for the first button
                                if (!showSearch) {
                                    setState(() {
                                     showSearch = true;
                                      showHome = false;
                                      showLikes = false;
                                      widget.searchResult = false;
                                    });
                                  };
                                print('Button 2 tapped!');
                              }),
                              const SizedBox(
                                width: 35,
                              ),
                              _buildSvgButton('assets/images/heart.svg',
                                  const Color(0xffFCFCFC), showLikes, () {
                                // Handle tap for the first button
                                initLikesList();
                                if (!showLikes) {
                                    setState(() {
                                    showLikes = true;
                                    showHome = false;
                                    showSearch = false;
                                    widget.searchResult = false;
                                    });
                                };
                                print('Button 3 tapped!');
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showHome)
                  HomeView(
                    data: proverbs,
                    Avl: widget.data,
                    onLikedChange: handleLikeChanged,
                    likes: initLikes,
                  ),
                if (showLikes)
                  LikesView(
                    data: likes,
                    onLikedChange: handleLikeChanged,
                    Avl: widget.data,
                  ),
                if (showSearch)
                  SearchView(data: widget.data.getDataList(), Avl: widget.data),
                if (widget.searchResult)
                  SearchResults(
                    query: widget.query,
                    data: widget.queryList,
                    Avl: widget.data,
                    chapter: widget.filter[0],
                    verse: widget.filter[1],
                    onLikedChange: handleLikeChanged,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSvgButton(String assetPath, Color iconColor, bool isCurrentPage, VoidCallback onPressed) {
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
