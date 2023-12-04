import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/engines/likes_generator.dart';
import 'package:wise_words/views/about_view.dart';

class SettingsView extends StatefulWidget {
  SettingsView({super.key, required this.likes, required this.Avl});
  final GenerateLikes likes;
  final AvlData Avl;
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDark = false;
  bool notifOn = false;

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
          color: Color(0xffFCFCFC),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: padding.top),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/images/back.svg'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Color(0xff1E1E1E)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Container(
                    height: 30,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showClearLikesConfirmation(context);
                          },
                          child: const Text(
                            'Clear Likes',
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
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Container(
                    height: 30,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutView()),
                            );
                          },
                          child: const Text(
                            'About',
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
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 536,
            ),
            Container(
                padding: EdgeInsets.only(bottom: padding.bottom),
                child: const Text(
                  'Build v0.0.0.0',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void showClearLikesConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to clear your likes?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                widget.Avl.removeFile();
                widget.Avl.clearLikes();
                Navigator.of(context)
                    .pop(); // Close the dialog after clearing likes
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }
}
