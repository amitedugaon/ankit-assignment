import 'package:ankit_assignment/controller/get_news_controller.dart';
import 'package:ankit_assignment/pages/favourite_page.dart';
import 'package:ankit_assignment/pages/home_page.dart';
import 'package:ankit_assignment/pages/profile_page.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetNewsContent getNewsContent = Get.put(GetNewsContent());

  @override
  initState() {
    super.initState();
    print(getNewsContent.listOfNewsVariable.length.toString());
  }

  List<Widget> screens = <Widget>[HomePage(), FavouritePage(), ProfilePage()];
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        child: screens[currentScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: currentScreen,
          onTap: (index) {
            currentScreen = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "favorite", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
