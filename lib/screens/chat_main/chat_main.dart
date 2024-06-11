import 'package:chatter_ease/screens/chat_main/menu/menu.dart';
import 'package:flutter/material.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key});

  @override
  State<ChatMainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(20));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: const MenuScreen(),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
        title: const Text(
          "Chat",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.05),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: border,
                      enabledBorder: border,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
                      hintText: "Search",
                      border: border),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
