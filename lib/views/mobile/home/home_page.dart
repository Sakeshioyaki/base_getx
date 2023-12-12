import 'package:base_getx/commons/app_images.dart';
import 'package:base_getx/views/mobile/home/home_vm.dart';
import 'package:base_getx/views/mobile/home/widget/note_widgets.dart';
import 'package:base_getx/views/mobile/home/widget/todo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final String? tag;

  const HomePage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    HomeVm homeVm = Get.find();
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildTabBar(theme, homeVm),
              Expanded(
                child: TabBarView(
                  controller: homeVm.tabController,
                  children: const [
                    NoteWidgets(),
                    TodoWidgets(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabBar(ThemeData theme, HomeVm homeVm) {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            controller: homeVm.tabController,
            dividerColor: Colors.transparent,
            indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            tabs: const [
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.note_alt,
                  size: 35,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.check_box,
                  size: 35,
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.person,
          color: theme.colorScheme.onPrimaryContainer,
        )
      ],
    );
  }
}
