import 'package:flutter/material.dart';
import 'package:picto/constants/fixed_colors.dart';

import '../../../constants/fixed_numbers.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
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
            "About Us",
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
                        "Welcome to our innovative application, designed to make your life a little more colorful and personalized. We are a team of dedicated developers committed to creating tools that enhance your digital experience. Our latest creation is an application that allows you to effortlessly change your phone's wallpaper, bringing a touch of uniqueness and style to your device.\n\n"
                        "At our core, we believe in the power of simplicity and convenience. We understand that your smartphone is an extension of your personality, and we strive to provide you with a seamless and intuitive solution to customize its appearance. With our application, you can easily explore a vast collection of stunning wallpapers and effortlessly transform the look and feel of your device in just a few taps.\n\n"
                        "We pride ourselves on delivering a user-friendly experience that is accessible to everyone. Our application is designed with a sleek and intuitive interface, ensuring that even those with minimal technical knowledge can navigate through our extensive library and find the perfect wallpaper that resonates with their unique style and preferences.\n\n"
                        "We also understand the importance of variety and personal expression. Our application offers an extensive range of wallpapers, including captivating landscapes, vibrant abstract designs, adorable pets, inspiring quotes, and much more. Whether you're in the mood for something calming, energizing, or thought-provoking, we have a wallpaper that will suit every mood and occasion.\n\n"
                        "We are constantly working behind the scenes to enhance our application, adding new features, and expanding our collection of wallpapers to ensure that you always have something fresh and exciting to choose from. We welcome your feedback and suggestions, as we believe in continuously improving our offerings to meet your evolving needs and preferences.\n\n"
                        "Thank you for choosing our application to transform your phone's wallpaper. We are thrilled to be part of your journey in making your device truly yours. Join us today and let your imagination run wild as you personalize your digital world with our user-friendly and visually stunning wallpapers.\n\n"
                        "Sincerely,\n\n"
                        "The Team at Picto",
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
