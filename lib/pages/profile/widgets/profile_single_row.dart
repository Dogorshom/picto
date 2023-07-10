import 'package:flutter/material.dart';

import '../../../constants/fixed_numbers.dart';
import '../../../widgets/sized_box.dart';

class GetProfileRow extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final VoidCallback? onTap;
  final bool? divider;
  final bool? automaticallyTailButton;
  final Widget? tail;
  final Color? titleColor;
  const GetProfileRow(
      {Key? key,
      required this.icon,
      required this.title,
      this.onTap,
      this.divider,
      this.automaticallyTailButton = true,
      this.tail,
      this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: fixedPadding - 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon!,
                    fixedSizedBoxWidth,
                    fixedSizedBoxWidth,
                    Text(
                      title!,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: titleColor),
                    ),
                  ],
                ),
                automaticallyTailButton!
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: fixedPadding),
                        child: Icon(
                          Icons.navigate_next,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : tail ?? Container()
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixedMainPadding * 1.5),
          child: divider == null || divider == true
              ? Divider(
                  color: Theme.of(context).focusColor.withOpacity(0.3),
                )
              : Container(),
        )
      ],
    );
  }
}
