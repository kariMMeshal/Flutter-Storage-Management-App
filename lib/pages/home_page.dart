import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_dialog.dart';
import 'package:login_register_flutter/authFunctions/sign_out.dart';
import 'package:login_register_flutter/fire_store.dart/delete_data.dart';
import 'package:login_register_flutter/fire_store.dart/getdata_func.dart';
import 'package:login_register_flutter/pages/update_folder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;
  Future getData() async {
    data = await GetdataFunc.getData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      CustomDialog(
                        context: context,
                        title: "??",
                        message: "What Do You Wanna Do To Me !! ",
                        dialogType: DialogType.warning,
                        btnOkText: "Edit File",
                        btnOkOnPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateFolder(
                                  docId: data[index].id,
                                  oldname: data[index]["category_name"],
                                ),
                              ));
                        },
                        btnCancelText: "Delete File",
                        btnCancelOnPress: () {
                          DeleteData.deleteData(
                              context: context, id: data[index].id);
                        },
                      ).customDialog();
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 130,
                            child: Image.asset("assets/images/folder.png"),
                          ),
                          Text(
                            "${data[index]["category_name"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ));
  }
}
