import 'package:communityapp/models/profile_model.dart';
import 'package:communityapp/repository/user_repository/userrepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();
  final userRepo = Get.put(UserRepo());
  final _auth = FirebaseAuth.instance;
  String? imageUrl;
  createUser(ProfileModel profile)
  {
    userRepo.createUser(profile);
  }
  getUserData()
   {
    final email = _auth.currentUser?.email.toString();
    if(email != null)
       {
        return  userRepo.getUserDetails(email);
      }
    else{
      Get.snackbar("Error", "Login to Continue");
    }
  }
  UpdateRecord(ProfileModel profile) async
  {
    await userRepo.UpdateuserRecord(profile);
  }

}