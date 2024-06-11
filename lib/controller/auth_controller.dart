import 'package:chatter_ease/models/payload_params.dart';
import 'package:chatter_ease/screens/chat_main/chat_main.dart';
import 'package:chatter_ease/services/auth_service.dart';
import 'package:chatter_ease/services/user_service.dart';
import 'package:chatter_ease/widgets/dialog_contents/registration_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  CreateAccountParams payload = CreateAccountParams();
  bool isCreatingAccount = false;
  bool isLoggingIn = false;
  UserCredential? user;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future createAccount() async {
    if (isCreatingAccount) {
      return;
    }
    setCreatingStatus(true);
    var res = await AuthService.createPasswordBasedAccount(payload);
    if (res.statusCode == 200) {
      var userRes =
          await UserService.createUser(res.data?.user?.uid ?? '', payload);
      await setCreatingStatus(false);
      if (userRes.statusCode == 200) {
        setUserCredential(res.data);
        Get.to(const ChatMainScreen());
        return;
      }
      setCreatingStatus(false);
      Get.bottomSheet(const RegistrationErrorModalContent(
          message:
              "We apologize for the inconvenience, but it seems that an unexpected error occurred. Try again in a few moments.",
          title: "Unexpected Error Occurred!"));
      return;
    }
    setCreatingStatus(false);
    Get.bottomSheet(RegistrationErrorModalContent(
      message: res.message ?? '',
      title: res.errorCode?.replaceAll('-', ' ').capitalize,
    ));
    return;
  }

  Future login() async {
    if (isLoggingIn) {
      return;
    }
    setLoggingInStatus(true);
    var res = await AuthService.loginWithEmailAndPassword(payload);
    if (res.statusCode == 200) {
      setLoggingInStatus(false);
      if (res.statusCode == 200) {
        setUserCredential(res.data);
        Get.to(const ChatMainScreen());
        return;
      }
      setLoggingInStatus(false);
      Get.bottomSheet(const RegistrationErrorModalContent(
          message:
              "We apologize for the inconvenience, but it seems that an unexpected error occurred. Try again in a few moments.",
          title: "Unexpected Error Occurred!"));
      return;
    }
    setLoggingInStatus(false);
    Get.bottomSheet(RegistrationErrorModalContent(
      message: res.message ?? '',
      title: res.errorCode?.replaceAll('-', ' ').capitalize,
    ));
    return;
  }

  setPayload(CreateAccountParams data) {
    payload = data;
    update();
  }

  setCreatingStatus(bool data) {
    isCreatingAccount = data;
    update();
  }

  setUserCredential(UserCredential? data) {
    user = data;
    update();
  }

  setLoggingInStatus(bool data) {
    isLoggingIn = data;
    update();
  }
}
