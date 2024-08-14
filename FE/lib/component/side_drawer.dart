import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/add_or_edit_member_page.dart';
import 'package:ecomboy/page/add_or_edit_product_page.dart';
import 'package:ecomboy/page/edit_profile_page.dart';
import 'package:ecomboy/page/item_detail_page.dart';
import 'package:ecomboy/page/item_faq_page.dart';
import 'package:ecomboy/page/landing_page.dart';
import 'package:ecomboy/page/product_list_page.dart';
import 'package:ecomboy/page/user_list_page.dart';
import 'package:ecomboy/page/order_item_page.dart';
import 'package:ecomboy/page/profile_page.dart';
import 'package:ecomboy/page/sell_record_page.dart';
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
          child: ListView(
            children: [
              Column(
                children: [
                  // member flow page
                  //=======================================================================================================
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LandingPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("landing page")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ItemDetailPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("item detail")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OrderItemPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("order item page")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ItemQuestionPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("item faq")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProfilePage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("profile")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => EditProfilePage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("edit profile")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // first page admin
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SellRecordPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("sell record")),
                    ),
                  ),
                  //=======================================================================================================
                  const SizedBox(height: 16),
                  Text('test page'),
                  const SizedBox(height: 16),
                  // admin flow start
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => UserListPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("main admin")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // add member
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AddEditMemberPage(
                                    type: 'add',
                                  ))));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("add member")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // edit member
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AddEditMemberPage(
                                    type: 'edit',
                                  ))));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("edit member")),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // product list page
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProductListPage())));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("product list page")),
                    ),
                  ),
                  // add product
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AddEditProductPage(
                                    type: 'add',
                                  ))));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("add product")),
                    ),
                  ),
                  // edit product
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AddEditProductPage(
                                    type: 'edit',
                                  ))));
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Text("edit product")),
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
