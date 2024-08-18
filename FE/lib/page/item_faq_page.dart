import 'dart:convert';

import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemQuestionPage extends StatefulWidget {
  ItemQuestionPage({super.key});

  @override
  State<ItemQuestionPage> createState() => _ItemQuestionPageState();
}

class _ItemQuestionPageState extends State<ItemQuestionPage> {
  final TextEditingController questionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    await inventory.getItemFaqAction();
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
                          horizontal: 16, vertical: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          value.permission != "MEM"
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(width: 32),
                                        Text(
                                          '${value.commonTrans['customerFaqTitle']}',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 2,
                                      width: double.infinity,
                                      color: Color.fromARGB(255, 80, 80, 79),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ProductBigPictureWidget(),
                              const SizedBox(width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${value.commonTrans['productName']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '${value.commonTrans['productPrice']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '${value.commonTrans['productDetail']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'dummy',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${value.commonTrans['faqQuestion']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    height: 200,
                                    width: 500,
                                    child: TextFormField(
                                      controller: questionController,
                                      readOnly: false,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      maxLines: 10,
                                      minLines: 6,
                                    ),
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
                                onTap: () async {
                                  Map<String, dynamic> data = {
                                    'question': questionController.text
                                  };
                                  if (value.itemFaq.containsKey('qnaid')) {
                                    data['qnaid'] = value.itemFaq['qnaid'];
                                  }

                                  debugPrint('${jsonEncode(data)}');
                                  // send question to BE
                                  value.addQuestionAction(data);

                                  Navigator.of(context).pop(true);
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
                                      value.permission != 'MEM'
                                          ? "${value.commonTrans['customerFaqReply']}"
                                          : "${value.commonTrans['fnqButton']}",
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
