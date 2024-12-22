import 'package:communityapp/controllers/profile_controller.dart';
import 'package:communityapp/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xffF1EFEF),
              const Color(0xffFFFFFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: FutureBuilder(
            future: null, builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done)
                {
                  if(snapshot.hasData)
                    {
                      ProfileModel userData = snapshot.data as ProfileModel;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: SizedBox(
                                      height: MediaQuery.of(context).size.height * .04,
                                      width: MediaQuery.of(context).size.width * .07,
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                      ))),
                              Transform.translate(
                                offset: Offset(-40, 0),
                                child: Text(
                                  'Account Settings',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 0,
                                width: 0,
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .04,
                          ),
                          Text(
                            userData.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height * .035,
                                          width: MediaQuery.of(context).size.width * .06,
                                          child: Image.asset('assets/images/img_6.png')),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * .03,
                                      ),
                                      Text(
                                        'Your Info',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffC6C6C6),
                                        size: 19,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height * .035,
                                          width: MediaQuery.of(context).size.width * .06,
                                          child: Image.asset('assets/images/img_5.png')),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * .03,
                                      ),
                                      Text(
                                        'Notifications',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffC6C6C6),
                                        size: 19,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height * .035,
                                          width: MediaQuery.of(context).size.width * .06,
                                          child: Image.asset('assets/images/img_4.png')),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * .03,
                                      ),
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffC6C6C6),
                                        size: 19,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height * .035,
                                          width: MediaQuery.of(context).size.width * .06,
                                          child: Image.asset('assets/images/img_3.png')),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * .03,
                                      ),
                                      Text(
                                        'Theme',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xffC6C6C6),
                                        size: 19,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .04,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height * .035,
                                        width: MediaQuery.of(context).size.width * .06,
                                        child: Image.asset('assets/images/img_2.png')),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .03,
                                    ),
                                    Text(
                                      'Terms & Conditions',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Color(0xffE6E7E6).withOpacity(.4)),
                                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ))),
                              ),
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height*.025,
                              // ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height * .035,
                                        width: MediaQuery.of(context).size.width * .06,
                                        child: Image.asset('assets/images/img_1.png')),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .03,
                                    ),
                                    Text(
                                      'Feedback',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Color(0xffE6E7E6).withOpacity(.4)),
                                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ))),
                              ),
                              // SizedBox(
                              //   height: MediaQuery.of(context).size.height*.025,
                              // ),
                              TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    titlePadding: EdgeInsets.only(top: 10),
                                    title: 'Delete Account?',
                                    titleStyle: TextStyle(fontSize: 20),
                                    middleText:
                                    'Are you sure, you want to delete your account?',
                                    confirm:
                                    TextButton(onPressed: () {}, child: Text('Yes')),
                                    cancel: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text('No')),
                                  );
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: MediaQuery.of(context).size.height * .035,
                                        width: MediaQuery.of(context).size.width * .06,
                                        child: Image.asset('assets/images/img.png')),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .03,
                                    ),
                                    Text(
                                      'Delete Account',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Color(0xffE6E7E6).withOpacity(.4)),
                                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ))),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                }
              else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Text('Something Went Wrong');
          }

          ),
        ),
      ),
    );
  }
}
