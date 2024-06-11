import 'package:chatter_ease/images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegistrationErrorModalContent extends StatelessWidget {
  final String message;
  final String? title;

  const RegistrationErrorModalContent({Key? key, this.message = '', this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 174, 112, 232),
            Color(0xFF4B0082)
          ], // Deep violet colors
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.forgotPassword),
                    ),
                  ),
                ),
                Text(
                  title ?? "Warning",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: SizedBox(
              height: 60,
              width: 500,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Adjust the value here
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(
                      context); // Assuming Get.back() was navigating back
                },
                child: const Text(
                  "Got it",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF4B0082),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
