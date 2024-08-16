import 'package:ecomboy/component/confirm_dialog.dart';
import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/add_or_edit_member_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List dataList = [];

  @override
  void initState() {
    super.initState();
    final inventory = Provider.of<InventoryProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await inventory.getUserAction();
      inventory.triggerUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final double totalWidth = MediaQuery.of(context).size.width;

    double percentWidth(double percent) {
      double ret;
      ret = (totalWidth - 420 - 64) * percent;
      return ret;
    }

    return Consumer<InventoryProvider>(builder: (context, value, child) {
      List<DataColumn> _getColumn() {
        return <DataColumn>[
          // id
          DataColumn(
            label: Container(
              width: percentWidth(0.05),
              child: Text(
                'ID',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // username
          DataColumn(
            label: Container(
              width: percentWidth(0.25),
              child: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // password
          DataColumn(
            label: Container(
              width: percentWidth(0.25),
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // email
          DataColumn(
            label: Container(
              width: percentWidth(0.25),
              child: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // edit
          DataColumn(
            label: Container(
              width: percentWidth(0.1),
              child: Text(
                'EDIT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // delete
          DataColumn(
            label: Container(
              width: percentWidth(0.1),
              child: Text(
                'DELETE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ];
      }

      List<DataRow> _getRow(List<Map<String, dynamic>> dataList) {
        List<DataRow> rows = [];
        // loop
        for (var data in dataList) {
          rows.add(
            DataRow(cells: <DataCell>[
              DataCell(Text(data['userid'] ?? '')),
              DataCell(Text(data['username'] ?? '')),
              DataCell(Text(data['password'] ?? '')),
              DataCell(Text(data['email'] ?? '')),
              DataCell(GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddEditMemberPage(
                            type: 'edit',
                            username: data['username'] ?? '',
                          )));
                },
                child: Container(
                  height: 36,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 3, 192, 59)),
                  child: Center(
                    child: Text(
                      "${value.commonTrans['tableEdit']}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
              DataCell(GestureDetector(
                onTap: () async {
                  bool? results = await ConfirmDialog.show(context);
                  if (results == true) {
                    debugPrint('delete confirm');
                  } else {
                    debugPrint('cancel');
                  }
                },
                child: Container(
                  height: 36,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 192, 3, 3)),
                  child: Center(
                    child: Text(
                      "${value.commonTrans['tableDelete']}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
            ]),
          );
        }
        // add empty rows
        while (rows.length < 5) {
          rows.add(DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]));
        }
        return rows;
      }

      // List<DataRow> _getRow() {
      //   return <DataRow>[
      //     DataRow(cells: <DataCell>[
      //       DataCell(Text('id')),
      //       DataCell(Text('username')),
      //       DataCell(Text('password')),
      //       DataCell(Text('email')),
      //       DataCell(GestureDetector(
      //         onTap: () {
      //           Navigator.of(context).push(MaterialPageRoute(
      //               builder: ((context) => AddEditMemberPage(type: 'edit'))));
      //         },
      //         child: Container(
      //           height: 36,
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(5),
      //               color: Color.fromARGB(255, 3, 192, 59)),
      //           child: Center(
      //             child: Text(
      //               "${value.commonTrans['tableEdit']}",
      //               style: const TextStyle(color: Colors.white),
      //             ),
      //           ),
      //         ),
      //       )),
      //       DataCell(GestureDetector(
      //         onTap: () async {
      //           bool? results = await ConfirmDialog.show(context);
      //           if (results == true) {
      //             debugPrint('delete confirm');
      //           } else {
      //             debugPrint('cancel');
      //           }
      //         },
      //         child: Container(
      //           height: 36,
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(5),
      //               color: Color.fromARGB(255, 192, 3, 3)),
      //           child: Center(
      //             child: Text(
      //               "${value.commonTrans['tableDelete']}",
      //               style: const TextStyle(color: Colors.white),
      //             ),
      //           ),
      //         ),
      //       )),
      //     ]),
      //     // dummy empty row
      //     DataRow(cells: <DataCell>[
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //     ]),
      //     DataRow(cells: <DataCell>[
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //     ]),
      //     DataRow(cells: <DataCell>[
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //     ]),
      //     DataRow(cells: <DataCell>[
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //       DataCell(Text('')),
      //     ]),
      //   ];
      // }

      return Scaffold(
          appBar: const TopAppBar(),
          drawer: const LeftDrawer(),
          body: Container(
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
                        EdgeInsets.symmetric(horizontal: 16, vertical: 128),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DataTable(
                            columnSpacing: 16,
                            border:
                                TableBorder.all(width: 1, color: Colors.black),
                            columns: _getColumn(),
                            rows: _getRow(value.userList)),
                        const SizedBox(
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => AddEditMemberPage(
                                      type: 'add',
                                      username: '',
                                    ))));
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 26, 13, 219)),
                            child: Center(
                              child: Text(
                                "${value.commonTrans['addMember']}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
