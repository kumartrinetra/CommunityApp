import 'package:communityapp/controllers/profile_controller.dart';
import 'package:communityapp/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Reusable Setting Row Widget
    Widget buildSettingRow({
      required String imagePath,
      required String title,
      VoidCallback? onPressed,
    }) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: screenHeight * .035,
                width: screenWidth * .06,
                child: Image.asset(imagePath),
              ),
              SizedBox(width: screenWidth * .03),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).iconTheme.color,
              size: 19,
            ),
          ),
        ],
      );
    }

    // Reusable Button Widget
    Widget buildThemedButton({
      required String imagePath,
      required String title,
      required VoidCallback onPressed,
    }) {
      return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: screenHeight * .035,
              width: screenWidth * .06,
              child: Image.asset(imagePath),
            ),
            SizedBox(width: screenWidth * .03),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffF1EFEF), Color(0xffFFFFFF)],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final ProfileModel userData = snapshot.data as ProfileModel;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppBar Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon:
                                const Icon(Icons.keyboard_arrow_left, size: 28),
                          ),
                          const Text(
                            'Account Settings',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 32), // Placeholder for symmetry
                        ],
                      ),
                      SizedBox(height: screenHeight * .04),
                      // User Name
                      Text(
                        userData.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * .03),
                      // Settings Rows
                      Column(
                        children: [
                          buildSettingRow(
                            imagePath: 'assets/images/img_6.png',
                            title: 'Your Info',
                            onPressed: () {},
                          ),
                          buildSettingRow(
                            imagePath: 'assets/images/img_5.png',
                            title: 'Notifications',
                            onPressed: () {},
                          ),
                          buildSettingRow(
                            imagePath: 'assets/images/img_4.png',
                            title: 'Password',
                            onPressed: () {},
                          ),
                          buildSettingRow(
                            imagePath: 'assets/images/img_3.png',
                            title: 'Theme',
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.dark_mode),
                                        title: const Text('Dark Mode'),
                                        onTap: () =>
                                            Get.changeTheme(ThemeData.dark()),
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.light_mode),
                                        title: const Text('Light Mode'),
                                        onTap: () =>
                                            Get.changeTheme(ThemeData.light()),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * .04),
                          buildThemedButton(
                            imagePath: 'assets/images/img_2.png',
                            title: 'Terms & Conditions',
                            onPressed: () {},
                          ),
                          buildThemedButton(
                            imagePath: 'assets/images/img_1.png',
                            title: 'Feedback',
                            onPressed: () {},
                          ),
                          buildThemedButton(
                            imagePath: 'assets/images/img.png',
                            title: 'Delete Account',
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'Delete Account?',
                                middleText:
                                    'Are you sure you want to delete your account?',
                                confirm: TextButton(
                                  onPressed: () {
                                    controller.DeleteAccount(userData.id!);
                                  },
                                  child: const Text('Yes'),
                                ),
                                cancel: TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('No'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.black));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const Center(child: Text('Something went wrong.'));
            },
          ),
        ),
      ),
    );
  }
}
