import 'dart:convert';

import 'package:ecomboy/component/function/common_function.dart';
import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditMemberPage extends StatefulWidget {
  final String type;
  final String username;
  const AddEditMemberPage(
      {super.key, required this.type, required this.username});

  @override
  State<AddEditMemberPage> createState() => _AddEditMemberPageState();
}

class _AddEditMemberPageState extends State<AddEditMemberPage> {
  int selectedRole = 1;

  final TextEditingController memberIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    if (widget.username != '') {
      //get data
      await inventory.getUserByUserNameAction(widget.username);
      if (inventory.userByUserName.isNotEmpty) {
        memberIdController.text = inventory.userByUserName['userid'] ?? '';
        userNameController.text = inventory.userByUserName['username'] ?? '';
        passwordController.text = inventory.userByUserName['password'] ?? '';
        firstNameController.text = inventory.userByUserName['name'] ?? '';
        lastNameController.text = inventory.userByUserName['sname'] ?? '';
        addressController.text = inventory.userByUserName['address'] ?? '';
        phoneNumberController.text = inventory.userByUserName['tel'] ?? '';
        emailController.text = inventory.userByUserName['email'] ?? '';
        selectedRole =
            radioMapFromString(inventory.userByUserName['permission']);
      }
      inventory.triggerUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isAdd = true;
    if (widget.type == 'add') {
      isAdd = true;
    } else if (widget.type == 'edit') {
      isAdd = false;
    }
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: const TopAppBar(),
          drawer: const LeftDrawer(),
          body: Consumer<InventoryProvider>(builder: (context, value, child) {
            return Container(
              color: Color.fromARGB(255, 211, 211, 211),
              child: Row(
                children: [
                  // first column
                  const SideColumnWidget(),
                  const SideVerticalLine(),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.type == 'edit'
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${value.commonTrans['EditMemberTitle']}",
                                      style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${value.commonTrans['addMemberTitle']}",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            color: Color.fromARGB(255, 143, 143, 143),
                            height: 1,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 16),
                          //1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 100,
                                  child: Text(
                                    '${value.commonTrans['employeeId']}',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                height: 36,
                                width: 200,
                                color: Colors.white,
                                child: TextField(
                                  enabled: widget.type == 'add' ? true : false,
                                  controller: memberIdController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: OutlineInputBorder()),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          //2
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      child: Text(
                                        '${value.commonTrans['tableUsername']}',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    height: 36,
                                    width: 200,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: userNameController,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      child: Text(
                                        '${value.commonTrans['tablePassword']}',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    height: 36,
                                    width: 200,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: passwordController,
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
                          //3
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      child: Text(
                                        '${value.commonTrans['firstName']}',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    height: 36,
                                    width: 200,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: firstNameController,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 100,
                                      child: Text(
                                        '${value.commonTrans['lastName']}',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    height: 36,
                                    width: 200,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: lastNameController,
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
                          //4
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 100,
                                  child: Text(
                                    '${value.commonTrans['Address']}',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                // height: 36,
                                width: 533,
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
                          const SizedBox(height: 8),
                          //5
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 100,
                                  child: Text(
                                    '${value.commonTrans['phoneNumber']}',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                height: 36,
                                width: 200,
                                color: Colors.white,
                                child: TextField(
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: OutlineInputBorder()),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          //6

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 100,
                                  child: Text(
                                    '${value.commonTrans['tableEmail']}',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                height: 36,
                                width: 250,
                                color: Colors.white,
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: OutlineInputBorder()),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          // radio button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: selectedRole,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRole = value!;
                                        });
                                      }),
                                  const SizedBox(width: 8),
                                  Text('${value.commonTrans['radioValue1']}')
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                      value: 2,
                                      groupValue: selectedRole,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRole = value!;
                                        });
                                        debugPrint('$selectedRole');
                                      }),
                                  const SizedBox(width: 8),
                                  Text('${value.commonTrans['radioValue2']}')
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                      value: 3,
                                      groupValue: selectedRole,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRole = value!;
                                        });
                                      }),
                                  const SizedBox(width: 8),
                                  Text('${value.commonTrans['radioValue3']}')
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                      value: 4,
                                      groupValue: selectedRole,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRole = value!;
                                        });
                                      }),
                                  const SizedBox(width: 8),
                                  Text('${value.commonTrans['radioValue4']}')
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  //get textbox value
                                  Map<String, dynamic> data = {
                                    'userid': memberIdController.text,
                                    'username': userNameController.text,
                                    'password': passwordController.text,
                                    'name': firstNameController.text,
                                    'sname': lastNameController.text,
                                    'address': addressController.text,
                                    'tel': phoneNumberController.text,
                                    'email': emailController.text,
                                    'permission': radioMapToString(selectedRole)
                                  };
                                  debugPrint('${jsonEncode(data)}');
                                  if (widget.type == 'add') {
                                    //create
                                    await value.createUserDataAction(data);
                                  } else if (widget.type == 'edit') {
                                    //update
                                    await value.updateUserDataAction(data);
                                  }
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserListPage()));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(255, 13, 228, 60)),
                                  child: Center(
                                    child: Text(
                                      "${value.commonTrans['addEditMemberConfirm']}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(255, 228, 13, 13)),
                                  child: Center(
                                    child: Text(
                                      "${value.commonTrans['cancelButton']}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
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
