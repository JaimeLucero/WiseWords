import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({super.key});

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  bool isDark = false;
  String selectedChapter = 'Chapter 1';
  String selectedVerse = 'Verse 1';
  List<int> selected = [];

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    List<String> chapters =
        List.generate(31, (index) => 'Chapter ${index + 1}');
    List<String> verses = List.generate(31, (index) => 'Verse ${index + 1}');

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Color(0xffFCFCFC),
      ),
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: padding.top),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                    selected
                  );
                },
                child: SvgPicture.asset('assets/images/back.svg'),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Filters',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: Color(0xff1E1E1E)),
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 25, left: 60),
            width: double.infinity,
            child: const Text(
              'Chapter:',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
        Container(
          padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
          width: double.infinity,
          child: DropdownButton<String>(
            value: selectedChapter,
            onChanged: (String? newValue) {
              setState(() {
                selectedChapter = newValue!;
              });
            },
            isExpanded: false,
            items: chapters.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 25, left: 60),
            width: double.infinity,
            child: const Text(
              'Verses:',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
        Container(
          padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
          width: double.infinity,
          child: DropdownButton<String>(
            value: selectedVerse,
            onChanged: (String? newValue) {
              setState(() {
                selectedVerse = newValue!;
              });
            },
            isExpanded: false,
            items: verses.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ]),
    ));
  }
}
