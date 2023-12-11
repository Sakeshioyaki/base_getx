import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:base_getx/views/mobile/home/home_page.dart';
import 'package:base_getx/widgets/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Hero(
                      tag: 'textSearch',
                      child: Material(
                        child: TextFieldCommon(
                          autofocus: true,
                          hintStyle: TextStyle(
                            fontFamily: AppConstants.fontK2D,
                            fontSize: 18,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(Dictionary.cancel),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
