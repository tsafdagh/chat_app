import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controller/login_controller.dart';

class UserInfoScreen extends GetView<LoginController> {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Obx(() => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: SpinKitRotatingPlain(
            color: Theme.of(context).primaryColor,
          ),
          child: Scaffold(
            body: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Container(
                    height: AppBar().preferredSize.height,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(4, 4),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: AppBar().preferredSize.height - 8,
                            height: AppBar().preferredSize.height - 8,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                borderRadius: BorderRadius.circular(32),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                            child: Text(
                          "User Information",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("SKIP"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .disabledColor
                                                    .withOpacity(0.1),
                                                blurRadius: 8,
                                                offset: const Offset(4, 4))
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: controller.selectedImage.value ==
                                                ""
                                            ? Image.asset(
                                                "assets/images/verification.jpg")
                                            : Image.file(
                                                File(controller
                                                    .selectedImage.value),
                                              ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0, right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .disabledColor
                                                      .withOpacity(0.1),
                                                  blurRadius: 8,
                                                  offset: const Offset(4, 4))
                                            ]),
                                        child: Material(
                                          color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(32),
                                              onTap: (){
                                                //controller.showPicker(context)
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Theme.of(context).backgroundColor,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
