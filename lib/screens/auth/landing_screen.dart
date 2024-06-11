import 'package:chatter_ease/lottie.dart';
import 'package:chatter_ease/screens/auth/login/login.dart';
import 'package:chatter_ease/screens/auth/registration/create_account_screent.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 174, 112, 232),
                  Color(0xFF4B0082)
                ], // Deep violet colors
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(LottieFile.redDino),
                      const Text(
                        'Chatter',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 34,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      Text(
                        'Ease',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 34,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 34),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.88,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.to(const CreateAccountScreen(),
                                      fullscreenDialog: true);
                                },
                                child: const Text(
                                  "Create an account",
                                  style: TextStyle(fontSize: 16),
                                )),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(const LoginScreen());
                              },
                              child: const Text(
                                "Login with Existing Account",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
