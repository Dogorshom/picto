import 'package:flutter/material.dart';
import 'package:picto/constants/fixed_colors.dart';
import 'package:picto/constants/fixed_numbers.dart';
import 'package:picto/pages/favourite/favourites_screen.dart';
import 'package:picto/pages/home/home_screen.dart';
import 'package:picto/pages/profile/profile_screen.dart';

enum WhichPage { home, profile, search, favourite }

class Home extends StatefulWidget {
  final WhichPage? whichPage;
  const Home({super.key, required this.whichPage});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WhichPage? pageToView;
  @override
  void initState() {
    print(widget.whichPage.toString());
    if (widget.whichPage == null) {
      pageToView = WhichPage.home;
    } else {
      pageToView = widget.whichPage!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff4A148C),
        Color(0xff470C6F),
        Color(0xff7B1FA2),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: fixedMainPadding, vertical: fixedPadding),
          // child: pageToView == WhichPage.search
          //     ? const SearchScreen()
          //     :
          child: pageToView == WhichPage.profile
              ? const ProfileScreen()
              : pageToView == WhichPage.favourite
                  ? const FavouritesScreen()
                  : const HomeScreen(),
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(color: blackColor.withOpacity(0.2)),
          padding: const EdgeInsets.symmetric(horizontal: fixedMainPadding * 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomCard(
                      isActive: pageToView == WhichPage.home,
                      title: "Home",
                      icon: Icon(
                        pageToView == WhichPage.home
                            ? Icons.home
                            : Icons.home_outlined,
                        size: 26,
                        color: pageToView == WhichPage.home
                            ? Colors.orange
                            : whiteColor.withOpacity(0.5),
                      )),
                  bottomCard(
                      isActive: pageToView == WhichPage.favourite,
                      title: "Favourite",
                      icon: Icon(
                        pageToView == WhichPage.favourite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 26,
                        color: pageToView == WhichPage.favourite
                            ? Colors.orange
                            : whiteColor.withOpacity(0.5),
                      )),
                  bottomCard(
                      isActive: pageToView == WhichPage.profile,
                      title: "Profile",
                      icon: Icon(
                        pageToView == WhichPage.profile
                            ? Icons.person
                            : Icons.person_outline,
                        size: 26,
                        color: pageToView == WhichPage.profile
                            ? Colors.orange
                            : whiteColor.withOpacity(0.5),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomCard(
      {required bool isActive, required String title, required Icon icon}) {
    return InkWell(
      onTap: () {
        switch (title) {
          case "Home":
            setState(() {
              pageToView = WhichPage.home;
            });

            break;
          case "Favourite":
            setState(() {
              pageToView = WhichPage.favourite;
            });
            break;
          case "Profile":
            setState(() {
              pageToView = WhichPage.profile;
            });
            break;
          default:
        }
      },
      child: Column(
        children: [
          icon,
          Text(title,
              style: isActive
                  ? Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.orange)
                  : Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: whiteColor.withOpacity(0.5)))
        ],
      ),
    );
  }
}
