import 'package:flutter/material.dart';
import 'package:picto/constants/fixed_colors.dart';
import 'package:picto/pages/profile/sub_pages/about_us_screen.dart';
import 'package:picto/pages/profile/sub_pages/customer_support_screen.dart';
import 'package:picto/pages/profile/sub_pages/privacy_policy_screen.dart';
import '../../../constants/fixed_numbers.dart';
import 'profile_single_row.dart';

///This is the first section of the profile screen which contain
///
///`Edit Profile`,`Appointments`,`My Doctors`,`Settings`
class ProfileFirstSection extends StatelessWidget {
  const ProfileFirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(fixedPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fixedBorderRadius),
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.deepOrange, offset: Offset(0, 0.5), blurRadius: 1)
          ]),
      child: Column(
        children: [
          GetProfileRow(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUsScreen()));
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: secondaryColor,
            ),
            title: 'About Us',
          ),
          GetProfileRow(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerSupportScreen()));
            },
            icon: Icon(
              Icons.headphones_outlined,
              color: secondaryColor,
            ),
            title: 'Customer Service',
          ),
          GetProfileRow(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen()));
            },
            icon: Icon(
              Icons.privacy_tip_outlined,
              color: secondaryColor,
            ),
            title: 'Privacy Policy',
            divider: false,
          ),
        ],
      ),
    );
  }
}
