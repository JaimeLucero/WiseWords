import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_words/views/about_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDark = false;
  bool notifOn = false;

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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Theme',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Switch(
                            value: isDark,
                            onChanged: (newValue) {
                              setState(() {
                                isDark = newValue;
                              });
                            })
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Switch(
                            value: notifOn,
                            onChanged: (newValue) {
                              setState(() {
                                notifOn = newValue;
                              });
                            })
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Container(
                    height: 30,
                    child: Row(
                      children: [
                        Text(
                          'Clear Favorites',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                          child: Text(
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
            SizedBox(height: 536,),
            Container(
              padding: EdgeInsets.only(bottom: padding.bottom),
              child: Text(
                'Build v0.0.0.0',
                style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 0,
                ),
                )
            )
          ],
        ),
      ),
    );
  }
}
