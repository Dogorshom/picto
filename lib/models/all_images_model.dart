import 'package:get/state_manager.dart';
import 'package:picto/models/single_image.dart';

class AllImagesModel extends GetxController {
  RxList<SingleImage> favouriteImagesList = <SingleImage>[].obs;
  RxList<SingleImage> exploreImagesList = <SingleImage>[].obs;
  RxList<SingleImage> abstractImagesList = <SingleImage>[].obs;
  RxList<SingleImage> animalsImagesList = <SingleImage>[].obs;
  RxList<SingleImage> flowersImagesList = <SingleImage>[].obs;
  RxList<SingleImage> palmImagesList = <SingleImage>[].obs;
  RxList<SingleImage> carsImagesList = <SingleImage>[].obs;
  RxString targetList = "Explore".obs;
  List<SingleImage> getImagesList() {
    if (targetList.value == "Explore") {
      // exploreImagesList.sort(
      //   (a, b) => a.title!.compareTo(b.title!),
      // );
      return exploreImagesList;
    }
    if (targetList.value == "Abstract") {
      return abstractImagesList;
    }
    if (targetList.value == "Animals") {
      return animalsImagesList;
    }
    if (targetList.value == "Flowers") {
      return flowersImagesList;
    }
    if (targetList.value == "Palm") {
      return palmImagesList;
    }
    if (targetList.value == "Cars") {
      return carsImagesList;
    }
    return exploreImagesList;
  }
}
