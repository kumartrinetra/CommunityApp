import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/models/profile_model.dart';
import 'package:communityapp/models/user_model.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(ProfileModel profile) async
  {
    await _db.collection('users').add(profile.toJson()).whenComplete(() => Get.snackbar('Done!', 'Wow'));
  }
  Future<ProfileModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('users').where('email', isEqualTo: email).get();
    final userData =
        snapshot.docs.map((e) => ProfileModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<ProfileModel>> getallUserDetails(String email) async {
    final snapshot = await _db.collection('users').get();
    final userData =
        snapshot.docs.map((e) => ProfileModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> UpdateuserRecord(ProfileModel profile) async {
    print('${profile.id}');
    _db.collection('users').doc(profile.id).update(profile.toJson()).whenComplete((){Get.snackbar('Done!', 'ProfileUpdated');});
  }
}
