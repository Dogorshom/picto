import 'package:flutter/material.dart';
import 'package:picto/pages/profile/widgets/profile_first_section.dart';
import 'package:picto/pages/profile/widgets/profile_second_section.dart';
import 'package:picto/widgets/sized_box.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          const ProfileFirstSection(),
          fixedSizedBoxHeight,
          const ProfileSecondSection()
          // Container(
          //   width: width,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(fixedBorderRadius),
          //       color: Theme.of(context).cardColor,
          //       boxShadow: [
          //         BoxShadow(
          //             color: Theme.of(context).shadowColor,
          //             offset: const Offset(0, 1),
          //             blurRadius: fixedBlur)
          //       ]),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //         vertical: fixedPadding * 1.5, horizontal: fixedPadding * 1.5),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Icon(
          //               Icons.mode_night_outlined,
          //               color: secondaryColor,
          //             ),
          //             fixedSizedBoxWidth,
          //             fixedSizedBoxWidth,
          //             Text(
          //               "UI Theme",
          //               style: Theme.of(context).textTheme.titleMedium,
          //             ),
          //           ],
          //         ),
          //         fixedSizedBoxHeight,
          //         fixedSizedBoxHeight,

          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
