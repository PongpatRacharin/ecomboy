import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return AppBar(
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
                        'User Name',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () async {
                    // remove sharedpref and push to login page
                    await value.clearPermission();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 240, 142, 30)),
                    child: Center(
                      child: Text(
                        value.commonTrans['Logout']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
