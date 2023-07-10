import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picto/pages/home/home.dart';
import 'package:picto/widgets/custom_button.dart';

import '../../constants/fixed_colors.dart';
import '../../constants/fixed_numbers.dart';
import '../../models/all_images_model.dart';
import '../../widgets/sized_box.dart';
import '../images/image_details_screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // AllImagesModel allImagesModel = Get.put<AllImagesModel>(AllImagesModel());

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Favourites",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // TextButton(
          //     onPressed: () async {
          //       SharedPreferences sharedPreferences =
          //           await SharedPreferences.getInstance();
          //       sharedPreferences.clear();
          //     },
          //     child: Text("kkdkd")),
          fixedSizedBoxHeight,
          fixedSizedBoxHeight,
          GetX<AllImagesModel>(
              init: AllImagesModel(),
              builder: (allImagesModel) {
                return allImagesModel.favouriteImagesList.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 9 / 16,
                                crossAxisSpacing: fixedPadding * 2,
                                mainAxisSpacing: fixedPadding * 2),
                        itemCount: allImagesModel.favouriteImagesList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageDetailsScreen(
                                    image: allImagesModel
                                        .favouriteImagesList[index],
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag:
                                  allImagesModel.favouriteImagesList[index].id!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    fixedBorderRadius * 2),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(
                                    allImagesModel
                                        .favouriteImagesList[index].imageUrl!,
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
                        },
                      ))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.2,
                          ),
                          const Center(
                            child: Text(
                              "You don't have favourites!,\nExplore Now!",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          fixedSizedBoxHeight,
                          fixedSizedBoxHeight,
                          CustomButton(
                              buttonText: "Explore Now",
                              width: width * 0.5,
                              onTap: () {
                                Get.to(() => Home(whichPage: WhichPage.home));
                              })
                        ],
                      );
              })
        ],
      ),
    );
  }
}
