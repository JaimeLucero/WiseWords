import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/views/home_view.dart';
import 'package:wise_words/views/likes_view.dart';
import 'package:wise_words/views/search_view.dart';

class ViewTemplate extends StatefulWidget {
  const ViewTemplate({super.key});

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

    return Scaffold(
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
                      height:
                          height - (100 + MediaQuery.of(context).padding.bottom),
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
                                if (showHome) {
                                } else {
                                  showHome = true;
                                  showLikes = false;
                                  showSearch = false;
                                }
                              });
                              print('Button 1 tapped!');
                            }),
                            const SizedBox(
                              width: 35,
                            ),
                            _buildSvgButton('assets/images/search.svg',
                                const Color(0xffFCFCFC), showSearch, () {
                              // Handle tap for theho first button
                              setState(() {
                                if (showSearch) {
                                } else {
                                  showSearch = true;
                                  showHome = false;
                                  showLikes = false;
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
                                if (showLikes) {
                                } else {
                                  showLikes = true;
                                  showHome = false;
                                  showSearch = false;
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
              if (showHome) HomeView(),
              if (showLikes) LikesView(),
              if (showSearch) SearchView(),
            ],
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
