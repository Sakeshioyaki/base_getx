import 'package:base_getx/app_ctrl.dart';
import 'package:base_getx/commons/app_time.dart';
import 'package:base_getx/views/mobile/create_note/create_note_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNotePage extends StatefulWidget {
  final String? tag;
  const CreateNotePage({super.key, this.tag});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  @override
  Widget build(BuildContext context) {
    AppCtrl appCtrl = Get.find();
    CreateNoteVm createNoteVm = Get.find();
    String dateTime = AppTime.getCurrentTime(appCtrl.currentLocale);
    ThemeData theme = Theme.of(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<CreateNoteVm>(builder: (logic) {
            return Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                      ),
                      Visibility(
                        visible: logic.isShowSave,
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.done,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: createNoteVm.titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            if (logic.isShowSave) {
                              logic.setShowButtonSave(false);
                            }
                            return 'Please enter some text';
                          }
                          if (formKey.currentState!.validate()) {
                            logic.setShowButtonSave(true);
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
                        controller: createNoteVm.contentController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            if (logic.isShowSave) {
                              logic.setShowButtonSave(false);
                            }

                            return 'Please enter some text';
                          }
                          if (formKey.currentState!.validate())
                            logic.setShowButtonSave(true);
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
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
