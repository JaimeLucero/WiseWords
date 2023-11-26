import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.iconColor, required this.page});
  final Color iconColor;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSvgButton('assets/images/home.svg', iconColor, page == 'home', () {
              // Handle tap for the first button
              print('Button 1 tapped!');
            }),
            const SizedBox(
              width: 35,
            ),
            _buildSvgButton('assets/images/search.svg', iconColor, page == 'search', () {
              // Handle tap for the first button
              print('Button 2 tapped!');
            }),
            const SizedBox(
              width: 35,
            ),
            _buildSvgButton('assets/images/heart.svg', iconColor, page == 'likes', () {
              // Handle tap for the first button
              print('Button 3 tapped!');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgButton(
      String assetPath, Color iconColor, bool condition, onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(iconColor.withOpacity(condition ? 1.0 : 0.7), BlendMode.srcIn),
      ),
    );
  }
}
