import 'package:communityapp/views/chat/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:communityapp/views/home/home_view.dart';
import 'package:communityapp/controllers/home_controller.dart';
import 'package:communityapp/views/chat/chat_view.dart';
import 'package:communityapp/views/learning/learning_view.dart';
import 'package:communityapp/views/profile/profile_view.dart';

class MainView extends StatelessWidget {
  final String username;
  final BottomNavController bottomNavController = Get.put(BottomNavController());
  MainView({
    required this.username,
});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeView(),
      chat_view(username: username),
      LearningPage(),
      MyProfilePage(),
    ];
    return Scaffold(
      body: Obx(() => screens[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: (index) => bottomNavController.changeIndex(index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Learning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
