import 'package:communityapp/models/profile_model.dart';
import 'package:communityapp/repository/user_repository/userrepo.dart';
import 'package:communityapp/views/profile/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
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
  DeleteAccount(String Id) async
  {
    final user = _auth.currentUser;
    try{
      if(user != null)
      {
        await user.delete();
        userRepo.DeleteuserRecord(Id);
        Get.snackbar('Done!', 'Account Deleted');
        Get.to(LoginPage());
      }
    }
    catch(e){
      Get.snackbar('Error!', 'Failed to delete account');
    }
  }
}