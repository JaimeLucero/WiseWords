import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/views/home_view.dart';
import 'package:wise_words/views/likes_view.dart';

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
      body: Center(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: const Color(0xff1E1E1E),
            ),
            Column(
              children: [
                Container(
                  width: width,
                  height: height - 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffFCFCFC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSvgButton(
                            'assets/images/home.svg', Color(0xffFCFCFC), () {
                          // Handle tap for the first button
                          setState(() {
                            if (showHome) {
                            } else {
                              showHome = true;
                              showLikes = false;
                            }
                          });
                          print('Button 1 tapped!');
                        }),
                        const SizedBox(
                          width: 35,
                        ),
                        _buildSvgButton(
                            'assets/images/search.svg', Color(0xffFCFCFC), () {
                          // Handle tap for the first button

                          print('Button 2 tapped!');
                        }),
                        const SizedBox(
                          width: 35,
                        ),
                        _buildSvgButton(
                            'assets/images/heart.svg', Color(0xffFCFCFC), () {
                          // Handle tap for the first button
                          setState(() {
                            if (showLikes) {
                            } else {
                              showLikes = true;
                              showHome = false;
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
            if (showHome) HomeView(),
            if (showLikes) LikesView(),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgButton(String assetPath, Color iconColor, onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        assetPath,
        colorFilter:
            ColorFilter.mode(iconColor.withOpacity(0.7), BlendMode.srcIn),
      ),
    );
  }
}
