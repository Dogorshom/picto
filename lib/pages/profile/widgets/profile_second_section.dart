import 'package:flutter/material.dart';
import 'package:picto/constants/fixed_colors.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constants/fixed_numbers.dart';
import 'profile_single_row.dart';

///This is the first section of the profile screen which contain
///
///`Edit Profile`,`Appointments`,`My Doctors`,`Settings`
class ProfileSecondSection extends StatelessWidget {
  const ProfileSecondSection({super.key});

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
              final box = context.findRenderObject() as RenderBox?;
              Share.share("Download this app and enjoy https://dogorshom.com",
                  sharePositionOrigin:
                      box!.localToGlobal(Offset.zero) & box.size);
            },
            icon: Icon(
              Icons.share_outlined,
              color: secondaryColor,
            ),
            title: 'Share App',
            divider: false,
          ),
        ],
      ),
    );
  }
}
