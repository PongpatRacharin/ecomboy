import 'package:ecomboy/component/menu_button.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/add_or_edit_member_page.dart';
import 'package:ecomboy/page/landing_page.dart';
import 'package:ecomboy/page/item_detail_page.dart';
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
            // first page
            MenuButton(
                text: "${value.commonTrans['menu_Main']}",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LandingPage())));
                }),
            const SizedBox(height: 8),
            // employee infomation
            MenuButton(
                text: "${value.commonTrans['menu_EmployeeInfo']}",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => LandingPage())));
                }),
            // add or edit page
            const SizedBox(height: 8),

            MenuButton(
                text: "${value.commonTrans['addMemberTitle']}",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AddEditMemberPage())));
                }),
            // add or edit page
            const SizedBox(height: 8),

            MenuButton(
                text: "${value.commonTrans['menu_ProductInfo']}",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ItemDetailPage())));
                }),
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
