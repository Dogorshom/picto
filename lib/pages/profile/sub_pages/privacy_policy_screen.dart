import 'package:flutter/material.dart';
import 'package:picto/constants/fixed_colors.dart';

import '../../../constants/fixed_numbers.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
            "Privacy Policy",
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
                        "At Picto, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we handle the information you provide when using our application. Please read this policy carefully to understand our practices regarding your data.\n\n"
                        "1- Collection of Information:\n"
                        "We want to assure you that we do not collect any personal information or data from our users. We do not require you to provide any personal details or create an account to use our application. Any wallpapers or images you select from our library are downloaded directly to your device and stored locally.\n\n"
                        "2- Usage of Information:\n"
                        "Since we do not collect any personal information, we do not use, share, or sell any data about our users. Your privacy is of utmost importance to us, and we have designed our application to operate without the need for data collection or tracking.\n\n"
                        "3- Cookies and Analytics:\n"
                        "Our application does not use cookies or any tracking technologies to collect information about your usage. We do not employ any analytics services that track your behavior or gather data about your interactions with the application.\n\n"
                        "4- Security:\n"
                        "Our application operates solely on your device and does not involve transmitting or storing any user data on external servers. However.\n\n"
                        "5- Children's Privacy:\n"
                        "Our application is intended for a general audience and does not target or collect personal information from children under the age of 13. If you believe that we may have inadvertently collected personal information from a child under the age of 13, please contact us, and we will promptly delete the information from our records.\n\n"
                        "6- Changes to the Privacy Policy:\n"
                        "We may occasionally update this Privacy Policy to reflect changes in our practices or legal requirements. We encourage you to review this policy periodically to stay informed about how we protect your privacy.\n\n"
                        "7- Contact Us:\n"
                        "If you have any questions or concerns regarding this Privacy Policy or our practices, please contact us at saloom.dogorshom@gmail.com. We will be happy to assist you and address any concerns you may have.\n\n"
                        "By using our application, you acknowledge and agree to the terms outlined in this Privacy Policy.\n\n"
                        "Last updated: June 2023",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
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
