import 'package:dgtera_tablet_app/reports/reportsList/Stock.dart';
import 'package:dgtera_tablet_app/reports/reportsList/catagorySummaryRange.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productMixRange.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productReturn.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productVoid.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productWaste.dart';
import 'package:dgtera_tablet_app/reports/reportsList/salesReport.dart';
import 'package:dgtera_tablet_app/reports/reportsList/salesReportPos.dart';
import 'package:dgtera_tablet_app/reports/reportsList/salesSummaryReports.dart';
import 'package:dgtera_tablet_app/reports/reportsList/stcPayment.dart';
import 'package:dgtera_tablet_app/reports/reportsList/discountReports.dart';
import 'package:dgtera_tablet_app/reports/reportsList/tilloperation.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int selectedIndex = 0;
  PageController pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: TextButton(
              onPressed: () {},
              child: Center(
                  child: Text(
                "Print",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
            ),
          ),
        ],
        title: Text("Reports",
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        // shape: CustomShapeBorder(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: MyDrawer(),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              color: Colors.white,
              width: 250,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        pageController.jumpToPage(index);
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      color: (selectedIndex == index)
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Tab $index"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          VerticalDivider(
            thickness: 2,
          ),
          Expanded(
              child: Container(
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.only(left: 120, right: 150),
              child: Container(
                color: Colors.white,
                child: PageView(
                  controller: pageController,
                  children: [
                    SalesReport(),
                    SalesSummaryReport(),
                    ProductMix(),
                    CatagorySummary(),
                    StcPayment(),
                    ProductVoid(),
                    ProductWaste(),
                    Productreturn(),
                    StockReport(),
                    TillOperation(),
                    SalesReportsPos(),
                    DiscountReports(),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
