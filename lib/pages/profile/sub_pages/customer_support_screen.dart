import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:picto/widgets/custom_button.dart';
import 'package:picto/widgets/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/fixed_colors.dart';
import '../../../constants/fixed_numbers.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.purple.shade900,
        const Color(0xff470C6F),
        Colors.purple.shade700,
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "Customer Support",
          ),
          backgroundColor: blackColor.withOpacity(0.3),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(fixedMainPadding),
                  child: Column(
                    children: [
                      Text(
                        "We are happy to serve you, please contact us via Email",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      fixedSizedBoxHeight,
                      fixedSizedBoxHeight,
                      fixedSizedBoxHeight,
                      Text(
                        "note: response usually in 2-5 business days",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      fixedSizedBoxHeight,
                      fixedSizedBoxHeight,
                      fixedSizedBoxHeight,
                      fixedSizedBoxHeight,
                      fixedSizedBoxHeight,
                      CustomButton(
                          buttonText: "Contact",
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "mailto:saloom.dogorshom@gmail.com?subject=Feedback"))) {
                              launchUrl(Uri.parse(
                                  "mailto:saloom.dogorshom@gmail.com?subject=Feedback"));
                            } else {
                              log("Can't Launch");
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
