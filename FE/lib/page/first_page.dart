import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Consumer<InventoryProvider>(builder: (context, value, child) {
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
                    const SizedBox(width: 8),
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
                            value.commonTrans['Login']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 240, 142, 30)),
                        child: Center(
                          child: Text(
                            value.commonTrans['SignUpButton']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
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
                  BestSellProduct(),
                  const SizedBox(height: 16),
                  Container(
                    height: 4,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 16),
                  // normal sell
                  NormalSellProduct(),
                ],
              ),
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
