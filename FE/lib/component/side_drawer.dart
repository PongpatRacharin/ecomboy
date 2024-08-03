import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/first_page.dart';
import 'package:ecomboy/page/main_admin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: ((context, value, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Drawer(
          // width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 16),
                  // first page
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => FirstPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("menu")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MainAdminPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("admin")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }));
  }
}
