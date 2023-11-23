import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? tag;

  const HomePage({super.key, this.tag});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
