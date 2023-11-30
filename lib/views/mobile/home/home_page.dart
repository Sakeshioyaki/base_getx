import 'package:base_getx/commons/app_images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String? tag;

  const HomePage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Image.asset(
                AppImages.ic_note_active,
                width: 10,
              ),
            ),
            Tab(
              icon: Image.asset(
                AppImages.ic_todo_active,
                width: 10,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [],
      ),
    );
  }
}
