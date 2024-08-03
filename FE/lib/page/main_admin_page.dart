import 'package:ecomboy/component/menu_button.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/table.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/first_page.dart';
import 'package:ecomboy/page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainAdminPage extends StatelessWidget {
  const MainAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final double totalWidth = MediaQuery.of(context).size.width - 310 - 32 - 32;

    return Consumer<InventoryProvider>(builder: (context, value, child) {
      List<DataColumn> _getColumn() {
        return <DataColumn>[
          // id
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: totalWidth * 0.05,
                child: Text(
                  'ID',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // username
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: totalWidth * 0.25,
                child: Text(
                  'Username',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // password
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: totalWidth * 0.25,
                child: Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // email
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: totalWidth * 0.25,
                child: Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // edit
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: totalWidth * 0.05,
                child: Text(
                  'EDIT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // delete
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: totalWidth * 0.05,
                child: Text(
                  'DELETE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ];
      }

      List<DataRow> _getRow() {
        return const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('id')),
            DataCell(Text('username')),
            DataCell(Text('password')),
            DataCell(Text('email')),
            DataCell(Text('edit button')),
            DataCell(Text('delete button')),
          ])
        ];
      }

      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 43, 41, 41),
            toolbarHeight: 70,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                color: Colors.white,
              );
            }),
            title: Text(
              "${value.commonTrans['title']}",
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 160,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hintText: value.commonTrans['productSearchHint'],
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 17, 141, 23)),
                        child: Center(
                          child: Text(
                            'Role',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          drawer: const LeftDrawer(),
          body: Container(
            color: Color.fromARGB(255, 211, 211, 211),
            child: Row(
              children: [
                // first column
                Container(
                  width: 310,
                  height: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      // first page
                      MenuButton(
                          text: "menu",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => FirstPage())));
                          }),
                      const SizedBox(height: 8),
                      // employee infomation
                      MenuButton(
                          text: "employ info",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => FirstPage())));
                          }),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: double.infinity,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 128),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("table"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columnSpacing: 16,
                              border: TableBorder.all(
                                  width: 1, color: Colors.black),
                              columns: _getColumn(),
                              rows: _getRow()),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 67, 62, 139)),
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

class BestSellProduct extends StatelessWidget {
  const BestSellProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${value.commonTrans['bestSell']}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 310),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProductIconWidget(productName: 'test1'),
                  ProductIconWidget(productName: 'test2'),
                  ProductIconWidget(productName: 'test3'),
                  ProductIconWidget(productName: 'test4'),
                  ProductIconWidget(productName: 'test5'),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class NormalSellProduct extends StatelessWidget {
  const NormalSellProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${value.commonTrans['normalSell']}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 310),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProductIconWidget(productName: 'test1'),
                      ProductIconWidget(productName: 'test2'),
                      ProductIconWidget(productName: 'test3'),
                      ProductIconWidget(productName: 'test4'),
                      ProductIconWidget(productName: 'test5'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProductIconWidget(productName: 'test6'),
                      ProductIconWidget(productName: 'test7'),
                      ProductIconWidget(productName: 'test8'),
                      ProductIconWidget(productName: 'test9'),
                      ProductIconWidget(productName: 'test10'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class ProductIconWidget extends StatelessWidget {
  final String productName;
  final String picturePath;
  const ProductIconWidget(
      {super.key, required this.productName, this.picturePath = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 150,
      child: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(productName)
            ],
          ),
        ),
      ),
    );
  }
}
