import 'package:ecomboy/component/menu_button.dart';
import 'package:ecomboy/component/menu_component.dart';
import 'package:ecomboy/component/side_drawer.dart';
import 'package:ecomboy/component/table.dart';
import 'package:ecomboy/component/top_app_bar.dart';
import 'package:ecomboy/inventoryProvider/inventory_provider.dart';
import 'package:ecomboy/page/landing_page.dart';
import 'package:ecomboy/page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

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
          // id
          DataColumn(
            label: Container(
              width: percentWidth(0.125),
              child: Text(
                '${value.commonTrans['tableProductSku']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // username
          DataColumn(
            label: Container(
              width: percentWidth(0.125),
              child: Text(
                '${value.commonTrans['tableProductOrderId']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // password
          DataColumn(
            label: Container(
              width: percentWidth(0.5),
              child: Text(
                '${value.commonTrans['tableProductName']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // email
          DataColumn(
            label: Container(
              width: percentWidth(0.125),
              child: Text(
                '${value.commonTrans['tableProductSend']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // edit
          DataColumn(
            label: Container(
              width: percentWidth(0.125),
              child: Text(
                '${value.commonTrans['tableProductStatus']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ];
      }

      List<DataRow> _getRow() {
        return <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('${value.commonTrans['tableProductSku']}')),
            DataCell(Text('${value.commonTrans['tableProductOrderId']}')),
            DataCell(Text('${value.commonTrans['tableProductName']}')),
            DataCell(Text('${value.commonTrans['tableProductSend']}')),
            DataCell(Text('${value.commonTrans['tableProductStatus']}')),
          ]),
          // dummy empty row
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('')),
          ]),
        ];
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
                          '${value.commonTrans['menu_PurchaseInfo']}',
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
                        Expanded(
                          child: DataTable(
                              columnSpacing: 16,
                              border: TableBorder.all(
                                  width: 1, color: Colors.black),
                              columns: _getColumn(),
                              rows: _getRow()),
                        ),
                        const SizedBox(
                          height: 35,
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
