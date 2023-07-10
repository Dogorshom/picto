import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/database_url.dart';
import '../models/all_images_model.dart';
import 'package:http/http.dart' as http;

import '../models/single_image.dart';

getAllImagesData() async {
  AllImagesModel allImagesModel = Get.put<AllImagesModel>(AllImagesModel());
  http.Response response = await http.get(googleSheetDatabaseUrl);
  var recievedImages = <SingleImage>[];
  log(response.body);
  Map dataRecieved = jsonDecode(response.body);
  for (int x = 1; x < dataRecieved["data"].length; x++) {
    print(dataRecieved["data"][x]);
    print(dataRecieved["data"][x]["Id"]);
    SingleImage singleImage = SingleImage(
        id: dataRecieved["data"][x]["Id"].toString(),
        title: dataRecieved["data"][x]["Title"],
        imageUrl: dataRecieved["data"][x]["Link"],
        description: dataRecieved["data"][x]["Description"],
        category: dataRecieved["data"][x]["Category"],
        imageClass: dataRecieved["data"][x]["Image Class"]);
    recievedImages.add(singleImage);
  }
  recievedImages.sort((a, b) => a.imageClass!.compareTo(b.imageClass!));
  for (var element in recievedImages) {
    allImagesModel.exploreImagesList.add(element);
    if (element.category == "Abstract") {
      allImagesModel.abstractImagesList.add(element);
    }
    if (element.category == "Animals") {
      allImagesModel.animalsImagesList.add(element);
    }
    if (element.category == "Flowers") {
      allImagesModel.flowersImagesList.add(element);
    }
    if (element.category == "Palm") {
      allImagesModel.palmImagesList.add(element);
    }
    if (element.category == "Cars") {
      allImagesModel.carsImagesList.add(element);
    }
  }
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getStringList("favouritesList") != null) {
    List<String> favouritesIdList =
        sharedPreferences.getStringList("favouritesList")!;
    for (var recievedElement in recievedImages) {
      for (var favouriteElementId in favouritesIdList) {
        if (recievedElement.id == favouriteElementId) {
          allImagesModel.favouriteImagesList.add(recievedElement);
        }
      }
    }
  }
}
