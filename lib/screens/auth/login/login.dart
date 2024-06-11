import 'package:chatter_ease/controller/auth_controller.dart';
import 'package:chatter_ease/widgets/input_widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late AuthController controller;
  bool agreedToTerms = false;
  String? error;
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => AuthController());
    controller = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Stack(
        children: [
          controller.isCreatingAccount
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: LoadingAnimationWidget.inkDrop(
                      color: const Color.fromARGB(255, 174, 112, 232),
                      size: 40),
                )
              : Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                  ),
                  body: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white
                            //   gradient: LinearGradient(
                            //     begin: Alignment.topLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color.fromARGB(255, 174, 112, 232),
                            //       Color(0xFF4B0082)
                            //     ], // Deep violet colors
                            //   ),
                            ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: Color.fromARGB(82, 206, 206, 206),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Form(
                                    key: formKey,
                                    child: SingleChildScrollView(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                PrimaryTextField(
                                                  controller: emailController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter your email';
                                                    }
                                                    if (!value.contains('@')) {
                                                      return 'Please enter a valid email address';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                PrimaryTextField(
                                                  labelText: "Password",
                                                  hintText: "Enter password",
                                                  controller:
                                                      passwordController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter password';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),

                                                // PrimaryTextField(
                                                //   labelText: "Password",
                                                //   hintText: "Enter password",
                                                //   obscureText: true,
                                                //   controller: passwordController,
                                                //   validator: (value) {
                                                //     if (value == null || value.isEmpty) {
                                                //       return 'Please enter your password';
                                                //     }
                                                //     return null;
                                                //   },
                                                // ),
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // PrimaryTextField(
                                                //   labelText: "Confirm Password",
                                                //   hintText: "Please confirm password",
                                                //   obscureText: true,
                                                //   controller: confirmpasswordController,
                                                //   validator: (value) {
                                                //     if (value == null || value.isEmpty) {
                                                //       return 'Please confirm you password';
                                                //     }
                                                //     return null;
                                                //   },
                                                // ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.88,
                                                  child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          shape:
                                                              MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0), // Adjust the value here
                                                            ),
                                                          ),
                                                          backgroundColor: MaterialStatePropertyAll(
                                                              emailController.text !=
                                                                          "" &&
                                                                      passwordController
                                                                              .text !=
                                                                          ""
                                                                  ? const Color(
                                                                      0xFF4B0082)
                                                                  : Colors
                                                                      .grey)),
                                                      onPressed: () async {
                                                        if (emailController
                                                                    .text ==
                                                                "" &&
                                                            passwordController
                                                                    .text ==
                                                                "") {
                                                          return;
                                                        }
                                                        if (formKey.currentState
                                                                ?.validate() ==
                                                            false) {
                                                          return;
                                                        }

                                                        controller.setPayload(
                                                            controller.payload
                                                              ..password =
                                                                  passwordController
                                                                      .text
                                                              ..emailAddress =
                                                                  emailController
                                                                      .text);
                                                        await controller
                                                            .login();
                                                      },
                                                      child: const Text(
                                                        "Login",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
        ],
      );
    });
  }
}
