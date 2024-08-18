import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/add_or_edit_member_page.dart';
import 'package:ecomboy/page/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    await inventory.getUserByUserNameAction(inventory.username);
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${value.commonTrans['profileInfoTitle']}",
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.w600),
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
                                    '${value.commonTrans['employeeId']}:',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                width: 200,
                                child: Text(
                                  '${value.userByUserName['userid']}',
                                  style: TextStyle(fontSize: 16),
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
                                        '${value.commonTrans['tableUsername']}:',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '${value.userByUserName['username']}',
                                      style: TextStyle(fontSize: 16),
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
                                    width: 200,
                                    child: Text(
                                      '${value.userByUserName['password']}',
                                      style: TextStyle(fontSize: 16),
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
                                        '${value.commonTrans['firstName']}:',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '${value.userByUserName['name']}',
                                      style: TextStyle(fontSize: 16),
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
                                        '${value.commonTrans['lastName']}:',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  const SizedBox(width: 16),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      '${value.userByUserName['sname']}',
                                      style: TextStyle(fontSize: 16),
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
                                    '${value.commonTrans['Address']}:',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                width: 533,
                                child: Text(
                                  '${value.userByUserName['address']}',
                                  style: TextStyle(fontSize: 16),
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
                                    '${value.commonTrans['phoneNumber']}:',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                width: 200,
                                child: Text(
                                  '${value.userByUserName['tel']}',
                                  style: TextStyle(fontSize: 16),
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
                                    '${value.commonTrans['tableEmail']}:',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Container(
                                width: 250,
                                child: Text(
                                  '${value.userByUserName['email']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          // permission
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 100,
                                  child: Text(
                                    '${value.commonTrans['Permission']}:',
                                    style: TextStyle(fontSize: 16),
                                  )),
                              const SizedBox(width: 16),
                              Text(
                                '${value.userByUserName['permission']}',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          // button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              AddEditMemberPage(
                                                type: 'edit',
                                                username: value
                                                    .userByUserName['username'],
                                              ))));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 31, 17, 228),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    '${value.commonTrans['editButton']}',
                                    style: TextStyle(color: Colors.white),
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
