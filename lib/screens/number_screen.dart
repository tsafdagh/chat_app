import 'dart:ui';

import 'package:chat_app/screens/verification_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                height: AppBar().preferredSize.height,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).disabledColor.withOpacity(0.1),
                        offset: Offset(4, 4),
                        blurRadius: 10)
                  ],
                  color: Theme.of(context).backgroundColor,
                ),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Container(
                      width: AppBar().preferredSize.height - 8,
                      height: AppBar().preferredSize.height - 8,
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(32),
                        child: InkWell(
                          onTap: (() {
                            Get.back();
                          }),
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.arrow_back,
                                color: Theme.of(context).primaryColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text("Registration",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  )
                ]),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: AspectRatio(
                        aspectRatio: 2,
                        child: Image.asset("assets/images/otp.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text("We will send you one time OTP on this number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.1),
                                    blurRadius: 10)
                              ]),
                          child: CountryCodePicker(
                            onChanged: (countryCode) {
                              print(countryCode.dialCode);
                            },
                            closeIcon: Icon(
                              Icons.close,
                              color: Theme.of(context).primaryColor,
                            ),
                            initialSelection: 'CM',
                            favorite: const ["CM", "US", "FR"],
                            showCountryOnly: false,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(0.1),
                                      blurRadius: 10)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Container(
                                height: 48,
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).primaryColor,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                        errorMaxLines: 1,
                                        contentPadding:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        errorText: null,
                                        border: InputBorder.none,
                                        hintText: "Number"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 40),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.1),
                                blurRadius: 10)
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to( VerificationScreen());
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: const Center(
                            child: Text(
                              "Generate OTP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
