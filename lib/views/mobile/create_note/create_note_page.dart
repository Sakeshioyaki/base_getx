import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNotePage extends StatelessWidget {
  final String? tag;

  const CreateNotePage({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    AppCtrl appCtrl = Get.find();
    String dateTime = AppTime.getCurrentTime(appCtrl.currentLocale);
    ThemeData theme = Theme.of(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        actions: [
          formKey.currentState != null && formKey.currentState!.validate()
              ?  InkWell(
            onTap: (){

            },
                  child: Icon(
                    Icons.done,
                    size: 30,
                  ),
                )
              : const SizedBox(),
          const SizedBox(width: 40),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: theme.textTheme.headlineLarge,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    hintText: 'Title',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  dateTime,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.surfaceTint),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: theme.textTheme.headlineSmall,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    hintText: 'Content',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
