import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Helpers/fire_b_helpers.dart';
import '../Models/app_user.dart';
import '../Utils/db_constants.dart';

class FDatabase {
  static final _db = FirebaseFirestore.instance;

  static final _userCollection = _db.collection(DbConstants.userPath);

  static Future<FDbResponse> addUserToDb(AppUser user) async {
    try {
      await _userCollection.doc(user.userId).set(AppUser.toJson(user));
      return FDbResponse(isSuccess: true);
    } catch (e) {
      return FDbResponse(message: e.toString());
    }
  }

  static Future<FDbResponse> isUserVerified(String userId) async {
    try {
      final user = await _userCollection.doc(userId).get();
      log('Authenticated === ${user.get(DbConstants.isAuthenticated).toString()}');
      return FDbResponse(isSuccess: user.get(DbConstants.isAuthenticated));
    } catch (e) {
      return FDbResponse(message: 'An Error Ocuured', content: false);
    }
  }

  static Future<FDbResponse> verifyUser(String userId) async {
    try {
      await _userCollection.doc(userId).update({
        DbConstants.isAuthenticated: true,
      });
      return FDbResponse(isSuccess: true);
    } catch (e) {
      return FDbResponse(message: e.toString());
    }
  }

  static Future<FDbResponse> addUserProfile(
      UserProfile profile, bool isClimateAction) async {
    try {
      if (!isClimateAction) {
        await _userCollection
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          '${DbConstants.profile}.${DbConstants.transport}': profile.transport,
          '${DbConstants.profile}.${DbConstants.bushBurning}':
              profile.bushBurning,
          '${DbConstants.profile}.${DbConstants.home}': profile.home,
          '${DbConstants.profile}.${DbConstants.food}': profile.food,
          '${DbConstants.profile}.${DbConstants.carbonFootprint}':
              profile.carbonFootprint,
        });
      } else {
        await _userCollection
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          '${DbConstants.profile}.${DbConstants.climateAction}':
              FieldValue.increment(profile.climateAction),
        });
      }
      return FDbResponse(message: 'ok', isSuccess: true);
    } catch (e) {
      return FDbResponse(message: 'An Error Ocuured', content: false);
    }
  }

  // static Future<FDbResponse> verifyUser(String userId) async {
  //   try {
  //     await _userCollection.doc(userId).update({
  //       DbConstants.isAuthenticated: true,
  //     });
  //     return FDbResponse(isSuccess: true);
  //   } catch (e) {
  //     return FDbResponse(message: e.toString());
  //   }
  // }
}
