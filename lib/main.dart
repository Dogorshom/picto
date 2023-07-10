import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/route_manager.dart';
import 'package:picto/pages/home/home.dart';
import 'package:picto/ui_manager/dark_theme.dart';
import 'controllers/get_images.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await getAllImagesData();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Picto',
      debugShowCheckedModeBanner: false,
      theme: darkThemeData,
      darkTheme: darkThemeData,
      home: const Home(
        whichPage: WhichPage.home,
      ),
    );
  }
}
