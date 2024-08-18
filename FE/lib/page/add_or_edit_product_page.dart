import 'dart:convert';

import 'package:ecomboy/component/menu_button.dart';
import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/table.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/landing_page.dart';
import 'package:ecomboy/page/product_list_page.dart';
import 'package:ecomboy/page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddEditProductPage extends StatefulWidget {
  final String type;
  final String itemcode;
  const AddEditProductPage(
      {super.key, required this.type, required this.itemcode});

  @override
  State<AddEditProductPage> createState() => _AddEditProductPageState();
}

class _AddEditProductPageState extends State<AddEditProductPage> {
  String productName = "";
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productInfoController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    if (widget.itemcode.isNotEmpty) {
      await inventory.getItemByCodeAction(widget.itemcode);
      productName = inventory.itemByCode['itemname'] ?? '';
      productNameController.text = inventory.itemByCode['itemname'] ?? '';
      productInfoController.text = inventory.itemByCode['itemdetail'] ?? '';
      productPriceController.text = inventory.itemByCode['price'] ?? '';
      inventory.triggerUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(builder: (context, value, child) {
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
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.type == 'add'
                              ? '${value.commonTrans['addEditProductTitle']}'
                              : productName != ''
                                  ? '$productName'
                                  : 'error',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Color.fromARGB(255, 80, 80, 79),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductPictureWidget(),
                            const SizedBox(width: 24),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.type == 'edit'
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(width: 130),
                                              Text(
                                                '${value.commonTrans['addEditProductEdit']}',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            '${value.commonTrans['productName']}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      height: 36,
                                      width: 500,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: productNameController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                                            border: OutlineInputBorder()),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            '${value.commonTrans['productDetail']}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      // height: 36,
                                      width: 500,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: productInfoController,
                                        maxLines: 15,
                                        minLines: 14,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                                            border: OutlineInputBorder()),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            '${value.commonTrans['productPrice']}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      height: 36,
                                      width: 500,
                                      color: Colors.white,
                                      child: TextField(
                                        controller: productPriceController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                                            border: OutlineInputBorder()),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // confirm
                            GestureDetector(
                              onTap: () async {
                                //get textbox value
                                try {
                                  Map<String, dynamic> data = {
                                    "itemname": productNameController.text,
                                    "itemdetail": productInfoController.text,
                                    "price": double.parse(
                                        productPriceController.text),
                                    "imagedata": "",
                                  };
                                  debugPrint('${jsonEncode(data)}');
                                  if (widget.type == 'add') {
                                    //create
                                    await value.createItemDataAction(data);
                                  } else if (widget.type == 'edit') {
                                    //update
                                    await value.updateItemDataAction(data);
                                  }
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductListPage()));
                                } catch (e, stack) {
                                  debugPrint('$e $stack');
                                }
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
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // cancel
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
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

class ProductPictureWidget extends StatelessWidget {
  const ProductPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 200,
      child: Placeholder(),
    );
  }
}
