import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picto/widgets/sized_box.dart';
import '../../../constants/fixed_numbers.dart';
import '../../../models/all_images_model.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  String whichCategory = "Explore";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          singleCategory(
            context,
            category: "Explore",
          ),
          fixedSizedBoxWidth,
          singleCategory(
            context,
            category: "Abstract",
          ),
          fixedSizedBoxWidth,
          singleCategory(
            context,
            category: "Animals",
          ),
          fixedSizedBoxWidth,
          singleCategory(
            context,
            category: "Flowers",
          ),
          fixedSizedBoxWidth,
          singleCategory(
            context,
            category: "Palm",
          ),
          fixedSizedBoxWidth,
          singleCategory(
            context,
            category: "Cars",
          ),
        ],
      ),
    );
  }

  Widget singleCategory(BuildContext context, {required String category}) {
    AllImagesModel allImagesModel = Get.put<AllImagesModel>(AllImagesModel());

    return InkWell(
      onTap: () {
        print(whichCategory.toString());
        print(category.toString());
        if (whichCategory != category) {
          setState(() {
            whichCategory = category;
            allImagesModel.targetList.value = category;
          });
        }
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 50),
        child: Container(
          decoration: BoxDecoration(
              color: whichCategory == category
                  ? Colors.orange[900]
                  : Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(fixedBorderRadius)),
          child: Padding(
            padding: const EdgeInsets.all(fixedPadding),
            child: Center(
                child: Text(
              category,
              style: whichCategory == category
                  ? Theme.of(context).textTheme.titleMedium
                  : Theme.of(context).textTheme.bodyMedium,
            )),
          ),
        ),
      ),
    );
  }
}
