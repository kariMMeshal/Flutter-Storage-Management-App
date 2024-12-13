import 'package:flutter/material.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_buttonauth.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_textfield.dart';
import 'package:login_register_flutter/fire_store.dart/add_data_func.dart';

class AddFolder extends StatefulWidget {
  const AddFolder({super.key});

  @override
  State<AddFolder> createState() => _AddFolderState();
}

class _AddFolderState extends State<AddFolder> {
  TextEditingController category = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Folder",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            CustomTextfield(
              hint: "Category Name",
              myController: category,
            ),
            const SizedBox(height: 20),
            CustomButtonauth(
              title: " ADD ",
              iconPath: "assets/images/folder.png",
              onPressed: () {
                AddDataFunc().addCategory(
                  context: context,
                  categoryName: category.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
