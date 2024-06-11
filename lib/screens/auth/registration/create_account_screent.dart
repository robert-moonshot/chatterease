import 'dart:developer';

import 'package:chatter_ease/controller/auth_controller.dart';
import 'package:chatter_ease/models/payload_params.dart';
import 'package:chatter_ease/screens/auth/registration/confirm_password_screen.dart';
import 'package:chatter_ease/widgets/input_widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CreateAccountScreen> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  late AuthController controller;
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => AuthController());
    controller = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
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
                          "Basic Info",
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
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      PrimaryTextField(
                                        labelText: "First Name",
                                        hintText: "Enter first name",
                                        controller: firstnameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please first name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      PrimaryTextField(
                                        labelText: "Last Name",
                                        hintText: "Enter last name",
                                        controller: lastnameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please last name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      GestureDetector(
                                        onTap: () async {
                                          final DateTime? picked =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: selectedDate,
                                                  firstDate: DateTime(1900, 8),
                                                  lastDate: DateTime.now());
                                          if (picked != null &&
                                              picked != selectedDate) {
                                            setState(() {
                                              selectedDate = picked;
                                              birthdateController.text =
                                                  DateFormat.yMMMMd()
                                                      .format(picked);
                                            });
                                          }
                                        },
                                        child: PrimaryTextField(
                                          enabled: false,
                                          controller: birthdateController,
                                          labelText: "Birthdate",
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your birthdate';
                                            }

                                            return null;
                                          },
                                        ),
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
                                  SizedBox(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    16.0), // Adjust the value here
                                              ),
                                            ),
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Color(0xFF4B0082))),
                                        onPressed: () {
                                          if (formKey.currentState
                                                  ?.validate() ==
                                              false) {
                                            return;
                                          }
                                          controller.setPayload(
                                              CreateAccountParams(
                                                  firstName:
                                                      firstnameController.text,
                                                  lastName:
                                                      lastnameController.text,
                                                  birthdate: selectedDate));
                                          Get.to(const SetPasswordScreen(),
                                              fullscreenDialog: true);
                                        },
                                        child: const Text(
                                          "Submit",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )),
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
      );
    });
  }
}
