import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picto/constants/fixed_colors.dart';
import 'package:picto/constants/fixed_numbers.dart';
import 'package:picto/models/all_images_model.dart';
import 'package:picto/pages/home/widgets/categories_section.dart';
import 'package:picto/pages/images/image_details_screen.dart';
import 'package:picto/widgets/sized_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<List<SingleImage>> _myFuture;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Wallpapers",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          fixedSizedBoxHeight,
          const CategoriesSection(),
          fixedSizedBoxHeight,
          GetX(
              init: AllImagesModel(),
              builder: (allImagesModel) {
                return Expanded(
                  child: Container(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 9 / 16,
                                crossAxisSpacing: fixedPadding * 2,
                                mainAxisSpacing: fixedPadding * 2),
                        itemCount: allImagesModel.getImagesList().length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImageDetailsScreen(
                                          image: allImagesModel
                                              .getImagesList()[index])));
                            },
                            child: Hero(
                              tag: allImagesModel.getImagesList()[index].id!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    fixedBorderRadius * 2),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.network(
                                    allImagesModel
                                        .getImagesList()[index]
                                        .imageUrl!,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: primaryColor,
                                        ),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    height: height,
                                    width: width,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                );
              })
        ],
      ),
    );
  }
}
