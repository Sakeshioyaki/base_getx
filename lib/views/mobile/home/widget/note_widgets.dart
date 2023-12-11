import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/views/mobile/search_page/search_page.dart';
import 'package:base_getx/widgets/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteWidgets extends StatelessWidget {
  const NoteWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Hero(
          tag: "textSearch",
          child: Material(
            child: TextFieldCommon(
                hintText: Dictionary.search.tr,
                hintStyle:
                    const TextStyle(fontFamily: AppConstants.fontK2D, fontSize: 18),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                onTap: () {
                  Get.to(
                    () => const SearchPage(),
                    duration: Duration(milliseconds: 500),
                  );
                }),
          ),
        ),
        const Text('djfsajfsklaf'),
        const Icon(
          Icons.add_a_photo,
          color: Colors.red,
          size: 100,
        )
      ],
    );
  }
}
