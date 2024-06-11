import 'package:chatter_ease/models/payload_params.dart';
import 'package:chatter_ease/services/api_status.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:developer' as dev;

class UserService {
  static Future<APIResponse> createUser(
      String uid, CreateAccountParams body) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
      await ref.set({
        "UserID": uid,
        "firstName": body.firstName,
        "lastName": body.lastName,
        "Email": body.emailAddress,
        "birthDate": body.birthdate?.toIso8601String()
      });
      dev.log("user service(400): Error");
      return APIResponse(statusCode: 200, success: true);
    } catch (e) {
      dev.log("user service(500): $e");
      return APIResponse(
          statusCode: 500,
          success: false,
          errorCode: 'Unexpected Error Occurred!',
          message:
              "We apologize for the inconvenience, but it seems that an unexpected error occurred. Try again in a few moments.");
    }
  }
}
