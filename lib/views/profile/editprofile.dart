import 'dart:io';
import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:communityapp/controllers/profile_controller.dart';
import 'package:communityapp/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/profile_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _githubController = TextEditingController();
  Future<ProfileModel> _getUserData() async {
    return await controller.getUserData();
  }

  ProfileController controller = ProfileController();
  String? imageLink;
  String? currId;
  @override
  void initState() {
    super.initState();
    _getUserData().then((userData) {
      _nameController.text = userData.name;
      currId = userData.id;
      //print('${userData.id}');
      _emailController.text = userData.email;
      _phoneController.text = userData.phone;
      _linkedinController.text = userData.linkedin;
      _githubController.text = userData.github;
      //print('${userData.avatarlink}');
      imageLink = userData.avatarlink;
    });
  }

  //ProfileController controller = Get.put(ProfileController());
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    //print('${imageLink}');
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
                          Get.off(MyProfilePage());
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
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width * .25,
                        child: selectedImage != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(selectedImage!),
                                radius: 25,
                              )
                            : imageLink != null
                                ? Image.network(imageLink!)
                                : Image.asset('assets/images/avatar.png'),
                      ),
                      Transform.translate(
                        offset: Offset(
                            -MediaQuery.of(context).size.width * .075,
                            MediaQuery.of(context).size.height * .03),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 25, horizontal: 25),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Pick Image',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .04,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    child: CircleAvatar(
                                                      radius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .04,
                                                      backgroundColor:
                                                          Colors.black,
                                                      child: CircleAvatar(
                                                        radius: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .038,
                                                        backgroundColor:
                                                            Color(0xffF7F2F9),
                                                        child: Center(
                                                            child: Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          color: Colors.black,
                                                        )),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _pickImageFromCamera();
                                                    },
                                                  ),
                                                  Text('Camera'),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    child: CircleAvatar(
                                                      radius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .04,
                                                      backgroundColor:
                                                          Colors.black,
                                                      child: CircleAvatar(
                                                        radius: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .038,
                                                        backgroundColor:
                                                            Color(0xffF7F2F9),
                                                        child: Center(
                                                            child: Icon(
                                                          Icons.photo,
                                                          color: Colors.black,
                                                        )),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _pickImageFromGallery();
                                                    },
                                                  ),
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
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * .055,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * .04,
                              backgroundColor: Color(0xff41BD73),
                              child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * .03,
                                  backgroundColor: Colors.transparent,
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
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                              child: TextFormField(
                                cursorHeight:
                                    MediaQuery.of(context).size.height * .02,
                                cursorWidth:
                                    MediaQuery.of(context).size.width * .003,
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
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                //initialValue: userData.name,
                                controller: _nameController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                              child: TextFormField(
                                cursorHeight:
                                    MediaQuery.of(context).size.height * .02,
                                cursorWidth:
                                    MediaQuery.of(context).size.width * .003,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15),
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: .5)),
                                ),
                                //initialValue: userData.email,
                                controller: _emailController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                              child: TextFormField(
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15),
                                cursorHeight:
                                    MediaQuery.of(context).size.height * .02,
                                cursorWidth:
                                    MediaQuery.of(context).size.width * .003,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: .5)),
                                ),
                                //initialValue: userData.phone,
                                controller: _phoneController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                              child: TextFormField(
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15),
                                cursorHeight:
                                    MediaQuery.of(context).size.height * .02,
                                cursorWidth:
                                    MediaQuery.of(context).size.width * .003,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: .5)),
                                ),
                                //initialValue: userData.linkedin,
                                controller: _linkedinController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              height: MediaQuery.of(context).size.height * .005,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .035,
                              child: TextFormField(
                                cursorHeight:
                                    MediaQuery.of(context).size.height * .02,
                                cursorWidth:
                                    MediaQuery.of(context).size.width * .003,
                                maxLines: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15),
                                expands: true,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: .5)),
                                ),
                                //initialValue: userData.github,
                                controller: _githubController,
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
                          final imageFile = File(selectedImage!.path);
                          if (imageFile.path.isNotEmpty) {
                            var cloudinary = Cloudinary.fromStringUrl(
                                'cloudinary://239118281366527:${dotenv.env['CloudinaryApi']}@daj7vxuyb');
                            final response =
                                await cloudinary.uploader().upload(imageFile);
                            if (response != null &&
                                response.data != null &&
                                response.data!.secureUrl != null) {
                              controller.imageUrl = response.data!.secureUrl!;
                            }
                          }
                          final userData = ProfileModel(
                            name: _nameController.text.trim(),
                            phone: _phoneController.text.trim(),
                            email: _emailController.text.trim(),
                            id: currId,
                            avatarlink: controller.imageUrl,
                            github: _githubController.text.trim(),
                            linkedin: _linkedinController.text.trim(),
                          );
                          await controller.UpdateRecord(userData);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Color(0xff41BD73)),
                            side: WidgetStateProperty.all(BorderSide(
                                width: 0, color: Colors.transparent)),
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
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
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }
}
