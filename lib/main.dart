import 'package:flutter/material.dart';
import 'package:wise_words/avltree/initalize_avl.dart';
import 'package:wise_words/views/welcome_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AvlData();
  runApp(const MaterialApp(home: WelcomeView()));
}
