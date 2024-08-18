import 'package:ecomboy/component/confirm_dialog.dart';
import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/add_or_edit_product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectBestSell extends StatefulWidget {
  const SelectBestSell({super.key});

  @override
  State<SelectBestSell> createState() => _SelectBestSellState();
}

class _SelectBestSellState extends State<SelectBestSell> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      initData();
    });
  }

  Future<void> initData() async {
    final inventory = Provider.of<InventoryProvider>(context, listen: false);
    await inventory.getItemListAction();
    inventory.triggerUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productInfoController = TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    final double totalWidth = MediaQuery.of(context).size.width;

    double percentWidth(double percent) {
      double ret;
      double containerPadding = 32 * 2;
      double tableContentPadding = 16 * 2;
      ret =
          (totalWidth - 410 - containerPadding - tableContentPadding) * percent;
      return ret;
    }

    return Consumer<InventoryProvider>(builder: (context, value, child) {
      List<DataColumn> _getColumn() {
        return <DataColumn>[
          // sku
          DataColumn(
            label: Container(
              width: percentWidth(0.1),
              child: Text(
                '${value.commonTrans['tableProductSku']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // product name
          DataColumn(
            label: Container(
              width: percentWidth(0.25),
              child: Text(
                '${value.commonTrans['tableProductName']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // product price
          DataColumn(
            label: Container(
              width: percentWidth(0.1),
              child: Text(
                '${value.commonTrans['tableProductListPrice']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // product type
          DataColumn(
            label: Container(
              width: percentWidth(0.2),
              child: Text(
                '${value.commonTrans['tableProductListType']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // stock
          DataColumn(
            label: Container(
              width: percentWidth(0.2),
              child: Text(
                '${value.commonTrans['tableProductListStock']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // edit
          DataColumn(
            label: Container(
              width: percentWidth(0.1),
              child: Text(
                '${value.commonTrans['tableProductListEdit']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ];
      }

      List<DataRow> _getRow(List<Map<String, dynamic>> dataList) {
        List<DataRow> rows = [];

        for (int i = 0; i < 5; i++) {
          if (i < dataList.length) {
            // loop
            var data = dataList[i];
            rows.add(
              DataRow(cells: <DataCell>[
                DataCell(Text(data['itemcode'] ?? '')),
                DataCell(Text(data['itemname'] ?? '')),
                DataCell(Text(data['itemprice'] ?? '')),
                DataCell(Text(data['itemtype'] ?? '')),
                DataCell(Text(data['balance'].toString() ?? '')),
                DataCell(GestureDetector(
                  onTap: () async {
                    bool? results = await ConfirmDialog.show(context);
                    if (results == true) {
                      // select best sell
                      await value.addBestSellAction(data['itemcode']);
                      await initData();
                    } else {
                      debugPrint('cancel');
                    }
                  },
                  child: Container(
                    height: 36,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 3, 192, 59)),
                    child: Center(
                      child: Text(
                        "${value.commonTrans['tableSelect']}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),
              ]),
            );
          } else {
            // add an empty rows
            rows.add(
              DataRow(cells: <DataCell>[
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
              ]),
            );
          }
        }

        return rows;
      }

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
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${value.commonTrans['menu_ProductInfo']}',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Color.fromARGB(255, 80, 80, 79),
                        ),
                        const SizedBox(height: 32),
                        DataTable(
                            columnSpacing: 16,
                            border:
                                TableBorder.all(width: 1, color: Colors.black),
                            columns: _getColumn(),
                            rows: _getRow(value.itemList)),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddEditProductPage(
                                        type: 'add', itemcode: '')));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(255, 45, 13, 228)),
                                child: Center(
                                  child: Text(
                                    "${value.commonTrans['addEditProductTitle']}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
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
