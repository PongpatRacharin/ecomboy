import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/item_faq_page.dart';
import 'package:ecomboy/page/order_item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatefulWidget {
  final String itemcode;
  const ItemDetailPage({super.key, required this.itemcode});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    await inventory.getItemByCodeAction(widget.itemcode);
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
              color: const Color.fromARGB(255, 211, 211, 211),
              child: Row(
                children: [
                  // first column
                  const SideColumnWidget(),
                  const SideVerticalLine(),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 64),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductBigPictureWidget(),
                              SizedBox(width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ชื่อสินค้า: ${value.itemByCode['itemname']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "ราคา: ${value.itemByCode['itemprice']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "รายละเอียด: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${value.itemByCode['itemdetail']}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderItemPage()));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 26, 13, 219)),
                                  child: Center(
                                    child: Text(
                                      "${value.commonTrans['makeOrderButton']}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ItemQuestionPage()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 103, 181, 255)),
                                  child: Center(
                                    child: Text(
                                      "${value.commonTrans['fnqButton']}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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

class ProductBigPictureWidget extends StatelessWidget {
  const ProductBigPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 200,
      child: Placeholder(),
    );
  }
}
