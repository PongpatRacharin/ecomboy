import 'dart:convert';

import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/item_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        initData();
      },
    );
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    await inventory.getLandingBestSellAction();
    await inventory.getLandingItemAction();
    inventory.triggerUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Consumer<InventoryProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: const TopAppBar(),
          drawer: const LeftDrawer(),
          body: Container(
            color: Color.fromARGB(255, 211, 211, 211),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  // best sell
                  BestSellProduct(
                    data: value.landingBestSell,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 4,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  // normal sell
                  NormalSellProduct(
                    data: value.landingItem,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}

class BestSellProduct extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const BestSellProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> currentRow = [];
    debugPrint(jsonEncode(data));

    for (int i = 0; i < data.length; i++) {
      currentRow.add(ProductIconWidget(
        data: data[i],
      ));

      if ((i + 1) % 5 == 0 || i == data.length - 1) {
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: currentRow,
        ));

        if (i != data.length - 1) {
          rows.add(const SizedBox(height: 8));
        }

        currentRow = [];
      }
    }

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 310),
              child: Column(
                children: rows,
              ),
            )
          ],
        ),
      );
    });
  }
}

class NormalSellProduct extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const NormalSellProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> currentRow = [];
    debugPrint(jsonEncode(data));

    for (int i = 0; i < data.length; i++) {
      currentRow.add(ProductIconWidget(
        data: data[i],
      ));

      if ((i + 1) % 5 == 0 || i == data.length - 1) {
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: currentRow,
        ));

        if (i != data.length - 1) {
          rows.add(const SizedBox(height: 8));
        }

        currentRow = [];
      }
    }

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 310),
              child: Column(
                children: rows,
              ),
            )
          ],
        ),
      );
    });
  }
}

class ProductIconWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProductIconWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDetailPage(
                  itemcode: data['itemcode'] ?? '',
                )));
      },
      child: Container(
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
                Text(data['itemname'])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
