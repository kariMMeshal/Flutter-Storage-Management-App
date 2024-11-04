import 'package:flutter/material.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_buttonauth.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_textfield.dart';
import 'package:login_register_flutter/fire_store.dart/update_data.dart';

class UpdateFolder extends StatefulWidget {
  final String oldname;
  final String docId;
  const UpdateFolder({super.key, required this.oldname, required this.docId});

  @override
  State<UpdateFolder> createState() => _UpdateFolderState();
}

class _UpdateFolderState extends State<UpdateFolder> {
  TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Folder",
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
              "New Name",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            CustomTextfield(
              hint: "oldName :  ${widget.oldname}",
              myController: category,
            ),
            const SizedBox(height: 20),
            CustomButtonauth(
              title: " Save ",
              iconPath: "assets/images/folder.png",
              onPressed: () {
                UpdateData().updateCategory(
                  context: context,
                  id: widget.docId,
                  newName: category.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
