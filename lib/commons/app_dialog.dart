import 'package:base_getx/commons/app_colors.dart';
import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:base_getx/l10n/enum_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static Future<void> messages({
    @required String? message,
    String? title,
    String? titleButton,
    VoidCallback? onTapOk,
    bool? iconNext = false,
    bool isCanCloseBySystemBack = true,
  }) async {
    Get.generalDialog(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return WillPopScope(
          onWillPop: () async {
            return isCanCloseBySystemBack;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: Get.width * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: Column(
                            children: [
                              Visibility(
                                visible: (title ?? "").isNotEmpty,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    title ?? "",
                                    style: const TextStyle(
                                      color: AppColors.mainTextColor,
                                      fontFamily: AppConstants.fontInter,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Text(
                                message ?? '${Dictionary.system_error}!',
                                style: const TextStyle(
                                  color: AppColors.subTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: onTapOk ??
                              () {
                                Get.back();
                              },
                          child: Container(
                            height: 45,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const SizedBox(width: 25),
                                Expanded(
                                  child: Text(
                                    titleButton ?? 'OK',
                                    style: const TextStyle(
                                      color: AppColors.mainTextColor,
                                      fontFamily: AppConstants.fontInter,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                iconNext == true
                                    ? const Icon(
                                        Icons.navigate_next_outlined,
                                        color: AppColors.buttonColorGrey,
                                        size: 20,
                                      )
                                    : const SizedBox(width: 15),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }
}
