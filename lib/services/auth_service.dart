import 'dart:developer';

import 'package:chatter_ease/models/payload_params.dart';
import 'package:chatter_ease/services/api_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

class AuthService {
  static Future<APIResponse<UserCredential?>> createPasswordBasedAccount(
      CreateAccountParams body) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: body.emailAddress ?? "",
        password: body.password ?? "",
      );
      await credential.user
          ?.updateDisplayName("${body.firstName} ${body.lastName}");

      return APIResponse(statusCode: 200, success: true, data: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      log(e.message ?? "");
      dev.log("user service(400): ${e.message}");
      return APIResponse(
          statusCode: 400,
          success: false,
          errorCode: e.code,
          error: e,
          message: e.message);
    } catch (e) {
      dev.log("user service(500): $e");
      return APIResponse(
          statusCode: 400,
          success: false,
          errorCode: 'Unexpected Error Occurred!',
          message:
              "We apologize for the inconvenience, but it seems that an unexpected error occurred. Try again in a few moments.");
    }
  }

  static Future<APIResponse<UserCredential?>> loginWithEmailAndPassword(
      CreateAccountParams body) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: body.emailAddress ?? "",
        password: body.password ?? "",
      );
      return APIResponse(statusCode: 200, success: true, data: credential);
    } on FirebaseAuthException catch (e) {
      return APIResponse(
          statusCode: 400,
          success: false,
          errorCode: e.code,
          error: e,
          message: e.message);
    } catch (e) {
      dev.log("user service(500): $e");
      return APIResponse(
          statusCode: 400,
          success: false,
          errorCode: 'Unexpected Error Occurred!',
          message:
              "We apologize for the inconvenience, but it seems that an unexpected error occurred. Try again in a few moments.");
    }
  }
}
