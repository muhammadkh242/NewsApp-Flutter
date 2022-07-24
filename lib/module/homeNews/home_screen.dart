import 'package:flutter/material.dart';
import 'package:news/shared/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildNewsItem();
  }
}
