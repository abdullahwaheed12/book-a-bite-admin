import 'dart:developer';
import 'package:admin_bite/controllers/general_controller.dart';
import 'package:admin_bite/controllers/login_controller.dart';
import 'package:admin_bite/layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthentication {
  void signInWithEmailAndPassword() async {
    try {
      final User? user =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Get.find<LoginLogic>().emailController.text,
        password: Get.find<LoginLogic>().passwordController.text,
      ))
              .user;
      Get.find<GeneralController>().updateFormLoader(false);
      if (user != null) {
        log(user.uid.toString());
        if (user.email.toString() == 'admin@bookabite.app') {
          Get.find<GeneralController>()
              .boxStorage
              .write('uid', user.uid.toString());
          log('user exist');
          Get.find<GeneralController>().boxStorage.write('session', 'active');

          Get.offAll(SiteLayout());
          Get.find<LoginLogic>().emailController.clear();
          Get.find<LoginLogic>().passwordController.clear();
        } else {
          Get.snackbar('Wrong Credentials', '');
        }
      } else {
        log('user not found');
        Get.find<GeneralController>().boxStorage.remove('session');
      }
    } on FirebaseAuthException catch (e) {
      Get.find<GeneralController>().updateFormLoader(false);
      Get.snackbar(
        e.code,
        '',
      );
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.find<GeneralController>().boxStorage.remove('uid');
    Get.find<GeneralController>().boxStorage.remove('session');
  }
}
