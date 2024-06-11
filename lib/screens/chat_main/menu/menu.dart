import 'package:chatter_ease/controller/auth_controller.dart';
import 'package:chatter_ease/controller/theme_controller.dart';
import 'package:chatter_ease/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MenuScreentState createState() => _MenuScreentState();
}

class _MenuScreentState extends State<MenuScreen> {
  String title = "Settings";
  late AuthController controller;
  late ThemeController theme;
  bool _switchValue = Get.isDarkMode ? true : false;
  ThemeMode _themeMode = ThemeMode.system;
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => AuthController());
    controller = Get.find<AuthController>();
    Get.lazyPut(() => ThemeController());
    theme = Get.find<ThemeController>();
  }

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() {
              if (title == "Settings") {
                Get.back();
                return;
              }
              setState(() {
                title = "Settings";
              });
              return;
            }),
          ),
          title: Text(title),
        ),
        body: Stack(
          children: <Widget>[
            // Container(
            //   decoration: const BoxDecoration(color: Colors.white),
            //   child: null,
            // ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  UserDetails(
                    name:
                        controller.auth.currentUser?.displayName ?? 'Anonymous',
                    phoneNumber: controller.auth.currentUser?.email ?? "",
                  ),
                  ListItems(
                    icon: Icons.light_mode_outlined,
                    title: "Notification",
                    custom: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoSwitch(
                        activeColor: const Color(0xFF4B0082),
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                          Get.changeTheme(
                              !value ? ThemeData.light() : ThemeData.dark());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
    required this.name,
    this.email,
    this.phoneNumber,
    this.imageURL,
  }) : super(key: key);

  final String name;
  final String? email;
  final String? phoneNumber;
  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 16),
      child: SizedBox(
        width: 358,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF4B0082),
                    child: Text(
                      name.substring(0, 1) ?? 'A',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      /*
                      Text(
                        email ?? "",
                        style: const TextStyle(
                          color: Color(0xff687782),
                          fontSize: 12,
                        ),
                      ),*/
                      Text(
                        phoneNumber!,
                        style: const TextStyle(
                          color: Color(0xff687782),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              // child: Icon(
              //   Icons.border_color,
              //   color: DesignSystem.foundation
              //       .primaryBackgroundC, //DesignSystem.foundation.primaryBackgroundA,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
    required this.icon,
    required this.title,
    this.expand = true,
    this.custom,
    this.action,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool? expand;
  final Widget? custom;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    var items = Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 30, 0),
                  child: Icon(
                    icon,
                    size: 30,
                    color: Color(0xFF4B0082),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (custom != null) custom ?? const SizedBox(),
          if (expand == true && custom == null)
            const Icon(
              Icons.expand_more,
              size: 30,
              color: Color(0xFF4B0082),
            ),
        ],
      ),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: action, child: items),
    );
  }
}

class ListItemsX extends StatelessWidget {
  const ListItemsX({
    Key? key,
    required this.icon,
    required this.title,
    this.expand = true,
    this.custom,
    this.textColor,
    this.action,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final bool? expand;
  final Widget? custom;
  final Color? textColor;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    var items = GestureDetector(
      onTap: action,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(border: Border()),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                    child: SizedBox(height: 24, width: 24, child: icon),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor ?? const Color(0xff333333),
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (custom != null) custom ?? const SizedBox(),
            if (expand == true && custom == null)
              const Icon(Icons.expand_more, size: 30, color: Color(0xFF4B0082)),
          ],
        ),
      ),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: action, child: items),
    );
  }
}
