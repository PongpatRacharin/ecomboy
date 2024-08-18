import 'package:ecomboy/component/menu_button.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/add_or_edit_member_page.dart';
import 'package:ecomboy/page/item_faq_page.dart';
import 'package:ecomboy/page/landing_page.dart';
import 'package:ecomboy/page/item_detail_page.dart';
import 'package:ecomboy/page/product_list_page.dart';
import 'package:ecomboy/page/profile_page.dart';
import 'package:ecomboy/page/sell_record_page.dart';
import 'package:ecomboy/page/user_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideColumnWidget extends StatelessWidget {
  const SideColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Container(
        width: 310,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            value.permission == 'ADM'
                ? AdminMenu()
                : value.permission == 'OWN'
                    ? ManagerMenu()
                    : value.permission == 'EMP'
                        ? EmployeeMenu()
                        : value.permission == 'MEM'
                            ? MemberMenu()
                            : const SizedBox.shrink()
          ],
        ),
      );
    });
  }
}

class SideVerticalLine extends StatelessWidget {
  const SideVerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.infinity,
      color: Colors.black,
    );
  }
}

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Column(
        children: [
          // first page
          MenuButton(
              text: "${value.commonTrans['menu_Main']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UserListPage())));
              }),
          const SizedBox(height: 8),
          // employee infomation
          MenuButton(
              text: "${value.commonTrans['menu_EmployeeInfo']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UserListPage())));
              }),
        ],
      );
    });
  }
}

class ManagerMenu extends StatelessWidget {
  const ManagerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Column(
        children: [
          // first page
          MenuButton(
              text: "${value.commonTrans['menu_Main']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UserListPage())));
              }),
          const SizedBox(height: 8),
          // employee infomation
          MenuButton(
              text: "${value.commonTrans['menu_EmployeeInfo']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UserListPage())));
              }),
          const SizedBox(height: 8),
          // product info
          MenuButton(
              text: "${value.commonTrans['menu_ProductInfo']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ProductListPage())));
              }),
          const SizedBox(height: 8),
          // purchase info
          MenuButton(
              text: "${value.commonTrans['menu_PurchaseInfo']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SellRecordPage())));
              }),
          const SizedBox(height: 8),
          // QnA
          MenuButton(
              text: "${value.commonTrans['menu_CustomerQA']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ItemQuestionPage())));
              }),
        ],
      );
    });
  }
}

class EmployeeMenu extends StatelessWidget {
  const EmployeeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Column(
        children: [
          // first page
          MenuButton(
              text: "${value.commonTrans['menu_Main']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UserListPage())));
              }),
          const SizedBox(height: 8),
          // employee infomation
          MenuButton(
              text: "${value.commonTrans['profileInfoTitle']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ProfilePage())));
              }),
          const SizedBox(height: 8),
          // product info
          MenuButton(
              text: "${value.commonTrans['menu_ProductInfo']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ProductListPage())));
              }),
          const SizedBox(height: 8),
          // purchase info
          MenuButton(
              text: "${value.commonTrans['menu_PurchaseInfo']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SellRecordPage())));
              }),
          const SizedBox(height: 8),
          // QnA
          MenuButton(
              text: "${value.commonTrans['menu_CustomerQA']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ItemQuestionPage())));
              }),
        ],
      );
    });
  }
}

class MemberMenu extends StatelessWidget {
  const MemberMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Column(
        children: [
          // main
          MenuButton(
              text: "${value.commonTrans['menu_Main']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LandingPage())));
              }),
          const SizedBox(height: 8),
          // profile
          MenuButton(
              text: "${value.commonTrans['profileInfoTitle']}",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ProfilePage())));
              }),
          const SizedBox(height: 8),
          // purchase info
          MenuButton(
              text: "${value.commonTrans['menu_PurchaseInfo']}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SellRecordPage())));
              }),
          const SizedBox(height: 8),
        ],
      );
    });
  }
}
