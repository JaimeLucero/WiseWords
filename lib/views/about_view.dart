import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Container(
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
                    'About',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Color(0xff1E1E1E)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            const SizedBox(
              width: 250,
              height: 275,
              child: Text(
                  '    This application, designed for a data structures class project, serves as a practical implementation of the AVL tree data structure. The task involved creating a Proverbs app, and this project accomplishes that by efficiently organizing and storing a list of proverbs in the said data structure. \n    It represents a thoughtful integration of theoretical concepts and hands-on programming, providing a straightforward yet effective solution to the assigned task.\n\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0,
                  ),
              ),
          ),
          SizedBox(height: 30,),
          SizedBox(
            width: 250,
            height: 61,
            child: Text(
                'Created by:\nJaime Emanuel B. Lucero\nBSCS-2A',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 0,
                ),
            ),
        )
          ],
        ),
      ),
    );
  }
}
