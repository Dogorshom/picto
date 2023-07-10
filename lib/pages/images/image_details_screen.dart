import 'dart:developer';
import 'dart:io';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:picto/constants/fixed_colors.dart';
import 'package:picto/constants/fixed_numbers.dart';
import 'package:picto/models/single_image.dart';
import 'package:picto/pages/profile/widgets/profile_single_row.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/all_images_model.dart';

class ImageDetailsScreen extends StatefulWidget {
  final SingleImage image;
  const ImageDetailsScreen({super.key, required this.image});

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  bool showAppBar = true;
  bool? isFavourite = false;
  bool showExportOverlay = false;

  @override
  void initState() {
    checkIfImageFavourite();
    super.initState();
  }

  checkIfImageFavourite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? userFavourite =
        sharedPreferences.getStringList("favouritesList");
    print(userFavourite.toString());
    if (userFavourite != null) {
      if (userFavourite.contains(widget.image.id)) {
        isFavourite = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AllImagesModel allImagesModel = Get.put<AllImagesModel>(AllImagesModel());

    return Hero(
      tag: widget.image.id!,
      child: Material(
        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: InkWell(
                onTap: () {
                  print("object");
                  setState(() {
                    showAppBar = !showAppBar;
                    if (showExportOverlay) {
                      showExportOverlay = false;
                    }
                  });
                },
                child: Image.network(
                  widget.image.imageUrl!,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: showAppBar ? AppBar().preferredSize.height + 50 : 0,
              curve: Curves.ease,
              child: AppBar(
                backgroundColor: blackColor.withOpacity(0.2),
                actions: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showExportOverlay = !showExportOverlay;
                          });
                        },
                        icon: const Icon(
                          Icons.ios_share_rounded,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var favouritesListId = <String>[];
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();

                          if (sharedPreferences
                                  .getStringList("favouritesList") !=
                              null) {
                            favouritesListId = sharedPreferences
                                .getStringList("favouritesList")!;
                          }
                          print("is Image Favourited: $isFavourite");
                          try {
                            if (isFavourite!) {
                              log("inside if");
                              allImagesModel.favouriteImagesList
                                  .remove(widget.image);
                              favouritesListId.remove(widget.image.id);
                            } else {
                              log("inside else");
                              allImagesModel.favouriteImagesList
                                  .add(widget.image);
                              favouritesListId.add(widget.image.id!);
                            }
                            print(
                                "this is list after pressing$favouritesListId");
                            await sharedPreferences.setStringList(
                                "favouritesList", favouritesListId);
                          } on Exception catch (e) {
                            print(e);
                          }
                          setState(() {
                            isFavourite = !isFavourite!;
                          });
                        },
                        icon: Icon(
                          isFavourite!
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 100,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 230),
                height: showExportOverlay ? 100 : 0,
                width: 230,
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(fixedBorderRadius)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GetProfileRow(
                          icon: Icon(Icons.share),
                          title: "Share",
                          automaticallyTailButton: false,
                          onTap: () async {
                            final box =
                                context.findRenderObject() as RenderBox?;
                            // subject is optional but it will be used
                            // only when sharing content over email
                            final respose = await http
                                .get(Uri.parse(widget.image.imageUrl!));
                            final bytes = respose.bodyBytes;
                            final temp = await getTemporaryDirectory();
                            final path = "${temp.path}/image.jpg";
                            File(path).writeAsBytesSync(bytes);
                            await Share.shareXFiles([XFile(path)],
                                text: "Look at this wallpaper",
                                subject: "Look at this wallpaper",
                                sharePositionOrigin:
                                    box!.localToGlobal(Offset.zero) & box.size);
                            // await Share.share("Look at this wallpaper",
                            //     subject: "link",
                            //     sharePositionOrigin:
                            //         box!.localToGlobal(Offset.zero) & box.size);
                          },
                        ),
                        GetProfileRow(
                          icon: Icon(Icons.travel_explore_outlined),
                          title: "Set as wallpaper",
                          divider: false,
                          automaticallyTailButton: false,
                          onTap: () async {
                            final respose = await http
                                .get(Uri.parse(widget.image.imageUrl!));
                            final bytes = respose.bodyBytes;
                            final temp = await getTemporaryDirectory();
                            final path = "${temp.path}/image.jpg";
                            File(path).writeAsBytesSync(bytes);
                            await AsyncWallpaper.setWallpaperFromFile(
                              filePath: path,
                              wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                              goToHome: false,
                              toastDetails: ToastDetails.success(),
                              errorToastDetails: ToastDetails.error(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
