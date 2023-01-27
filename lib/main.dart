import 'package:dgtera_tablet_app/Provider/DineInProvider.dart';
import 'package:dgtera_tablet_app/Provider/tax_provider.dart';
import 'package:dgtera_tablet_app/pages/pincode.dart';
import 'package:dgtera_tablet_app/pages/setting.dart';
import 'package:dgtera_tablet_app/product/allProducts.dart';
import 'package:dgtera_tablet_app/dashbored/dashbored.dart';
import 'package:dgtera_tablet_app/history/history.dart';
import 'package:dgtera_tablet_app/reports/zReport.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/pages/login.dart';
import 'package:dgtera_tablet_app/reports/reports.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/addTax.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Provider/UserLogProvider.dart';
import 'utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserLogProvider()),
        ChangeNotifierProvider(create: (context) => TaxProvider()),
        ChangeNotifierProvider(create: (context) => DineInProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: MyHomePage(),
          initialRoute: "/",
          routes: {
            "/": (context) => Login(),
            MyRoutes.dashboredRoute: (context) => DashboredScreen(),
            MyRoutes.loginRoute: (context) => Login(),
            MyRoutes.resumeRoute: (context) => ResumeScreen(),
            MyRoutes.reports: (context) => ReportScreen(),
            MyRoutes.zreports: (context) => Zreport(),
            MyRoutes.history: (context) => HistoryScreen(),
            MyRoutes.product: (context) => ProductDetails(),
            MyRoutes.password: (context) => ChangePinCode(),
            MyRoutes.setting: (context) => Setting(),
            MyRoutes.tax: (context) => AddTax(),
          }),
    );
  }
}
