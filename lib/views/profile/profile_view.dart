import 'package:communityapp/controllers/profile_controller.dart';
import 'package:communityapp/models/profile_model.dart';
import 'package:communityapp/views/profile/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'accountsettings.dart';
import 'editprofile.dart';
import 'helpdesk.dart';

//import 'package:hackslashprofile/editprofilepage.dart';
//import 'package:hackslashprofile/helpdesk.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              const Color(0xffF1EFEF),
              const Color(0xffFFFFFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {

                  if (snapshot.hasData) {
                    ProfileModel userData = snapshot.data as ProfileModel;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .04,
                                    width:
                                        MediaQuery.of(context).size.width * .07,
                                    child: Image.asset(
                                      'assets/images/left.png',
                                    ))),
                            IconButton(
                                onPressed: () {},
                                icon: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .04,
                                    width:
                                        MediaQuery.of(context).size.width * .07,
                                    child: Image.asset(
                                        'assets/images/settings.png'))),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .018,
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                width: MediaQuery.of(context).size.width * .25,
                                child: userData.avatarlink != null
                                    ? CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(userData.avatarlink!),
                                        radius: 25,
                                      )
                                    : Image.asset('assets/images/avatar.png')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(userData.name,
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .085,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontFamily: 'JosefinSans', fontSize: 13),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.off(EditProfile());
                                  },
                                  child: Row(children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .022,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .04,
                                        child: Image.asset(
                                            'assets/images/edit.png')),
                                    Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xff2E57FB),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .027,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6FCEF),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/email.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .016,
                                            ),
                                            Text(
                                              'Email',
                                              style: TextStyle(
                                                fontFamily: 'JoseLight',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          userData.email,
                                          style: TextStyle(
                                              fontFamily: 'JosefinSans'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .0038,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6FCEF),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/phone.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .016,
                                            ),
                                            Text(
                                              'Phone',
                                              style: TextStyle(
                                                fontFamily: 'JoseLight',
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          userData.phone,
                                          style: TextStyle(
                                              fontFamily: 'JosefinSans'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .0038,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6FCEF),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/linkedin.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .016,
                                            ),
                                            Text(
                                              'Linkedin',
                                              style: TextStyle(
                                                fontFamily: 'JoseLight',
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          userData.linkedin,
                                          style: TextStyle(
                                              fontFamily: 'JosefinSans'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .0038,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE6FCEF),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/img_10.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .016,
                                            ),
                                            Text(
                                              'Github',
                                              style: TextStyle(
                                                fontFamily: 'JoseLight',
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          userData.github,
                                          style: TextStyle(
                                              fontFamily: 'JosefinSans'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Utilities',
                                  style: TextStyle(
                                      fontFamily: 'JosefinSans', fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .015,
                            ),
                            Column(
                              children: [
                                // Container(
                                //   width: MediaQuery.of(context).size.width * 1,
                                //   height: MediaQuery.of(context).size.height * .058,
                                //   decoration: BoxDecoration(
                                //     color: Color(0xffE6FCEF),
                                //     borderRadius: BorderRadius.only(
                                //         topLeft: Radius.circular(8),
                                //         topRight: Radius.circular(8)),
                                //   ),
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 10, right: 15),
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //       children: [
                                //         Row(
                                //           children: [
                                //             SizedBox(
                                //               child: Image.asset(
                                //                   'assets/images/analytics.png'),
                                //               height:
                                //                   MediaQuery.of(context).size.height *
                                //                       .1,
                                //               width: MediaQuery.of(context).size.width *
                                //                   .06,
                                //             ),
                                //             SizedBox(
                                //               width: MediaQuery.of(context).size.width *
                                //                   .018,
                                //             ),
                                //             Text(
                                //               'User Analytics',
                                //               style: TextStyle(
                                //                 fontFamily: 'JosefinSans',
                                //               ),
                                //             )
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height:
                                //               MediaQuery.of(context).size.height * .1,
                                //           width:
                                //               MediaQuery.of(context).size.width * .06,
                                //           child: IconButton(
                                //             onPressed: () {},
                                //             icon:
                                //                 Image.asset('assets/images/right.png'),
                                //             style: ButtonStyle(
                                //                 padding: MaterialStateProperty.all(
                                //                     EdgeInsets.zero),
                                //                 tapTargetSize:
                                //                     MaterialTapTargetSize.shrinkWrap),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .0038,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6FCEF),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/accountset.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .018,
                                            ),
                                            Text(
                                              'Account Settings',
                                              style: TextStyle(
                                                fontFamily: 'JosefinSans',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .06,
                                          child: IconButton(
                                            onPressed: () {
                                              Get.to(AccountSettings());
                                            },
                                            icon: Image.asset(
                                                'assets/images/right.png'),
                                            style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.zero),
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .0038,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6FCEF),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/helpdesk.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .07,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .018,
                                            ),
                                            Text(
                                              'HelpDesk',
                                              style: TextStyle(
                                                fontFamily: 'JosefinSans',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .06,
                                          child: IconButton(
                                            onPressed: () {
                                              Get.to(HelpDesk());
                                            },
                                            icon: Image.asset(
                                                'assets/images/right.png'),
                                            style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.zero),
                                              // tapTargetSize:
                                              //     MaterialTapTargetSize.shrinkWrap
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .0038,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * .058,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6FCEF),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/logout.png'),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .018,
                                            ),
                                            Text(
                                              'Log Out',
                                              style: TextStyle(
                                                fontFamily: 'JosefinSans',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .06,
                                          child: IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: 'Log Out',
                                                  titlePadding:
                                                      EdgeInsets.only(top: 20),
                                                  titleStyle:
                                                      TextStyle(fontSize: 18),
                                                  confirm: TextButton(
                                                    onPressed: () {
                                                      _auth.signOut();
                                                      Get.to(LoginPage());
                                                    },
                                                    child: Text('Yes'),
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty
                                                                .all(EdgeInsets
                                                                    .zero),
                                                        tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap),
                                                  ),
                                                  cancel: TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text('No'),
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty
                                                                .all(EdgeInsets
                                                                    .zero),
                                                        tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap),
                                                  ),
                                                  middleText:
                                                      'Are you sure, you want to log out?',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                          vertical: 10));
                                            },
                                            icon: Image.asset(
                                                'assets/images/right.png'),
                                            style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.zero),
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Text('Something Went Wrong');
              },
            ),
          ),
        ),
      ),
    );
  }
}
