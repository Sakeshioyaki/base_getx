import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/modals/note_model.dart';
import 'package:base_getx/views/mobile/search_page/search_page.dart';
import 'package:base_getx/widgets/note_item.dart';
import 'package:base_getx/widgets/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteWidgets extends StatelessWidget {
  const NoteWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(height: 20),
        Hero(
          tag: "textSearch",
          child: Material(
            child: TextFieldCommon(
              hintText: Dictionary.search.tr,
              hintStyle: const TextStyle(
                fontFamily: AppConstants.fontK2D,
                fontSize: 18,
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
              ),
              background: theme.colorScheme.secondaryContainer.withOpacity(0.5),
              onTap: () {
                Get.to(
                  () => const SearchPage(),
                  duration: const Duration(milliseconds: 800),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: buildNotes(theme: theme),
        ),
      ],
    );
  }

  Widget buildNotes({required ThemeData theme}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NoteItem(
          theme: theme,
          note: NoteModel(title: 'ddddddd', content: 'kkkkkkkkk'),
        ),
      ],
    );
  }
}
