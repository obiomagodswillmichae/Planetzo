import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Helpers/fire_b_helpers.dart';
import '../Models/app_user.dart';
import 'db_service.dart';

class FAuth {
  static final _auth = FirebaseAuth.instance;

  static Future<FAuthResponse> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      log(credential.toString());
      if (credential.user == null) {
        return FAuthResponse(message: 'User is null'); 
      }
      final user = AppUser(
        firstName: firstName,
        email: email,
        userId: credential.user!.uid,
        lastName: lastName,
        userName: userName,
        profile: UserProfile()
      );
      final dbStatus = await FDatabase.addUserToDb(user);
      if (!dbStatus.isSuccess) {
        return FAuthResponse(
            message: 'Failed to add user to database', content: dbStatus);
      }
      return FAuthResponse(
          message: 'Sign up success',
          isSuccess: true,
          content: credential.user!.uid);
    } on FirebaseAuthException catch (authE) {
      return FAuthResponse(message: authE.toString());
    } catch (e) {
      return FAuthResponse(message: e.toString());
    }
  }

  Future<void> addActionGroup(String title, String body, String groupName) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference notificationsRef =
    FirebaseFirestore.instance.collection('Action');
    await notificationsRef.doc(groupName).collection('groups').add({
      'title': title,
      'body': body,
    });
  }
  Future<void> sendMessage(String chatId, String conversation, ) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference notificationsRef =
    FirebaseFirestore.instance.collection('Messages');
    await notificationsRef.doc(chatId).collection('chats').add({
      'chatId': chatId,
      'conversation': conversation,
    });
  }


  static Future<FAuthResponse> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final isVerified = await FDatabase.isUserVerified(credential.user!.uid);
      if (!isVerified.isSuccess && !isVerified.content) {
        return FAuthResponse(message: isVerified.message);
      } else if (!isVerified.isSuccess) {
        return FAuthResponse(message: 'Account not verified', content: {
          'redirect': true,
          'userId': credential.user!.uid,
        });
      }
      if (credential.user == null) {
        return FAuthResponse(message: 'User is null');
      }
      return FAuthResponse(
          message: 'Login Successful',
          content: credential.user,
          isSuccess: true);
    } on FirebaseAuthException catch (authE) {
      log(authE.toString());
      return FAuthResponse(message: authE.toString());
    } catch (e) {
      log(e.toString());
      return FAuthResponse(message: e.toString());
    }
  }

  static Future logOut() async {
    await _auth.signOut();
  }
  void signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
  Future clearFirebaseCache() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return;
    }
  }

}
