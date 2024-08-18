import 'dart:convert';

import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController snameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    await inventory.getUserByUserNameAction(inventory.username);
    if (inventory.userByUserName.isNotEmpty) {
      nameController.text = inventory.userByUserName['name'] ?? '';
      snameController.text = inventory.userByUserName['sname'] ?? '';
      addressController.text = inventory.userByUserName['address'] ?? '';
      telController.text = inventory.userByUserName['tel'] ?? '';
      emailController.text = inventory.userByUserName['email'] ?? '';
    }
    inventory.triggerUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: const TopAppBar(),
          drawer: const LeftDrawer(),
          body: Consumer<InventoryProvider>(builder: (context, value, child) {
            return Container(
              color: const Color.fromARGB(255, 211, 211, 211),
              child: Row(
                children: [
                  // first column
                  const SideColumnWidget(),
                  const SideVerticalLine(),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 236, vertical: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 200),
                                  Text(
                                    '${value.commonTrans['editProfileTitle']}',
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        child: Text(
                                          '${value.commonTrans['firstName']}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Container(
                                        height: 36,
                                        width: 200,
                                        color: Colors.white,
                                        child: TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder()),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${value.commonTrans['lastName']}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 16),
                                      Container(
                                        height: 36,
                                        width: 206,
                                        color: Colors.white,
                                        child: TextField(
                                          controller: snameController,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder()),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      '${value.commonTrans['phoneNumber']}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    height: 36,
                                    width: 500,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: telController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      '${value.commonTrans['Address']}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    // height: 36,
                                    width: 500,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: addressController,
                                      maxLines: 10,
                                      minLines: 6,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Map<String, dynamic> data = {
                                    'userid': value.userByUserName['userid'],
                                    'name': nameController.text,
                                    'sname': snameController.text,
                                    'address': addressController.text,
                                    'tel': telController.text,
                                  };
                                  debugPrint(jsonEncode(data));
                                  // var res =
                                  //     await value.updateUserDataAction(data);
                                  // if (res == 'success') {
                                  //   Navigator.of(context).pushReplacement(
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const LandingPage()));
                                  // }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(255, 3, 192, 59)),
                                  child: Center(
                                    child: Text(
                                      "${value.commonTrans['saveButton']}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }));
    });
  }
}
