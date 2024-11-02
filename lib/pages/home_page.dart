import 'package:flutter/material.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/login_logo.dart';
import 'package:login_register_flutter/authFunctions/sign_out.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.pushNamed(context, "AddFolder");
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "HomePage",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  SignOut.logOut(context);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.orange,
                ))
          ],
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: SizedBox(
                  height: 100,
                  child: Image.asset("assets/images/folder.png"),
                )),
                const Text("File Name : "),
              ],
            ),
          ],
        ));
  }
}
