import 'dart:io';

import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_api/uploader/uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_url_gen/util/environment.dart';
import 'package:communityapp/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/profile_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController controller = Get.put(ProfileController());
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        'Edit Profile',
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
                  height: MediaQuery.of(context).size.height * .025,
                ),
                FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        ProfileModel userData = snapshot.data as ProfileModel;
                        TextEditingController nameController =
                            TextEditingController(text: userData.name);
                        TextEditingController emailController =
                            TextEditingController(text: userData.email);
                        TextEditingController phoneController =
                            TextEditingController(text: userData.phone);
                        TextEditingController linkedinController =
                            TextEditingController(text: userData.linkedin);
                        TextEditingController githubController =
                            TextEditingController(text: userData.github);
                        return Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    child: selectedImage != null
                                        ? Image.file(selectedImage!)
                                        : userData.avatarlink != null
                                            ? Image.network(
                                                userData.avatarlink!)
                                            : Icon(Icons.person),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 25,
                                                        horizontal: 25),
                                                child: Column(
                                                  children: [
                                                    Text('Pick Image'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  _pickImageFromCamera();
                                                                },
                                                                icon: Icon(Icons
                                                                    .camera_alt_rounded)),
                                                            Text('Camera'),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  _pickImageFromGallery();
                                                                },
                                                                icon: Icon(Icons
                                                                    .photo)),
                                                            Text('Gallery'),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Transform.translate(
                                      offset: Offset(-23, 20),
                                      child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                .055,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .04,
                                          backgroundColor: Color(0xff41BD73),
                                          child: CircleAvatar(
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .03,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Image.asset(
                                                'assets/images/edit.png',
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff9A9494),
                                              fontSize: 12.5),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .035,
                                      child: TextFormField(
                                        cursorHeight:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        cursorWidth:
                                            MediaQuery.of(context).size.width *
                                                .003,
                                        maxLines: null,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 15),
                                        expands: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          //enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5, color: Color(0xff41BD73))),
                                          //border: UnderlineInputBorder(borderSide: BorderSide(width: .5, color: Color(0xff41BD73))),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                        ),
                                        //initialValue: userData.name,
                                        controller: nameController,

                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email Address',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff9A9494),
                                              fontSize: 12.5),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .035,
                                      child: TextFormField(
                                        cursorHeight:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        cursorWidth:
                                            MediaQuery.of(context).size.width *
                                                .003,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 15),
                                        maxLines: null,
                                        expands: true,
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          border: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: .5)),
                                        ),
                                        //initialValue: userData.email,
                                        controller: emailController,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Phone',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff9A9494),
                                              fontSize: 12.5),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .035,
                                      child: TextFormField(
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 15),
                                        cursorHeight:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        cursorWidth:
                                            MediaQuery.of(context).size.width *
                                                .003,
                                        maxLines: null,
                                        expands: true,
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          border: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: .5)),
                                        ),
                                        //initialValue: userData.phone,
                                        controller: phoneController,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Linkedin',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff9A9494),
                                              fontSize: 12.5),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .035,
                                      child: TextFormField(
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 15),
                                        cursorHeight:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        cursorWidth:
                                            MediaQuery.of(context).size.width *
                                                .003,
                                        maxLines: null,
                                        expands: true,
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          border: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: .5)),
                                        ),
                                        //initialValue: userData.linkedin,
                                        controller: linkedinController,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Github',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: Color(0xff9A9494),
                                              fontSize: 12.5),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .005,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .035,
                                      child: TextFormField(
                                        cursorHeight:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        cursorWidth:
                                            MediaQuery.of(context).size.width *
                                                .003,
                                        maxLines: null,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'JosefinSans',
                                            fontSize: 15),
                                        expands: true,
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          border: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: .5)),
                                        ),
                                        //initialValue: userData.github,
                                        controller: githubController,
                                      ),
                                    ),
                                  ],
                                ),
                                //SizedBox(height: MediaQuery.of(context).size.height * .020,),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * .12,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                              child: OutlinedButton(
                                onPressed: () async {
                                  final userData = ProfileModel(
                                    name: nameController.text.trim(),
                                    phone: phoneController.text.trim(),
                                    email: emailController.text.trim(),
                                    //avatarlink: controller.imageUrl.toString(),
                                    github: githubController.text.trim(),
                                    linkedin: linkedinController.text.trim(),
                                  );
                                  await controller.UpdateRecord(userData);
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff41BD73)),
                                    side: MaterialStateProperty.all(BorderSide(
                                        width: 0, color: Colors.transparent)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                              ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
    final response = await Cloudinary().uploader().upload(selectedImage);
    if (response != null &&
        response.data != null &&
        response.data!.secureUrl != null) {
      controller.imageUrl = response.data!.secureUrl!;
    }
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
    final response = await Cloudinary().uploader().upload(selectedImage);
    if (response != null &&
        response.data != null &&
        response.data!.secureUrl != null) {
      controller.imageUrl = response.data!.secureUrl!;
    }
  }
}
