import 'package:dgtera_tablet_app/pages/login.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/transferTable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/UserLogProvider.dart';

// ignore: must_be_immutable
class AppBarScreen extends StatefulWidget with PreferredSizeWidget {
  final Size preferredSize;
  // String text;

  AppBarScreen() : preferredSize = Size.fromHeight(56.0);

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  Future<void> insertUserLog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? logintime = prefs.getString('nameCus');
    String? username = prefs.getString('username');

    print('usernameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${username}');
    print('logintimeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${logintime}');

    final response = await post(
        Uri.parse("https://api.woga-pos.com/insert_userslog.php"),
        body: {
          'username': username,
          // 'user_id': _selectedUser!.id,
          'date': DateFormat.yMMMd().format(DateTime.now()).toString(),
          'logintime': logintime,
          'logouttime': DateFormat.Hm().format(DateTime.now()).toString()
        });

    if (response.statusCode == 200) {
      print(response.body);
      print("UserLog inserted successfully");
    } else {
      print("UserLog not inserted");
    }
  }

  Future<void> userLogout(String userId, String username) async {
    final response = await post(
        Uri.parse(
          "https://api.woga-pos.com/insert_userslogouttime.php",
        ),
        body: {
          'user_id': userId,
          'username': username,
          'logouttime': DateFormat.Hm().format(DateTime.now()).toString(),
        });

    if (response.statusCode == 200) {
      print(response.body);

      print("UserLog inserted successfully");
    } else {
      print("UserLog not inserted");
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    var userLog = Provider.of<UserLogProvider>(context, listen: false);

    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          tooltip: 'lock user',
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => Login()));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.grey,
          ),
          tooltip: 'End Sesion',
          onPressed: () {
            insertUserLog();

            userLogout(userLog.id, userLog.name);
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_off,
            color: Colors.grey,
          ),
          tooltip: 'notification off',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.sync,
            color: Colors.grey,
          ),
          tooltip: 'Sync',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => TransferTable()));
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.wifi_rounded,
            color: Colors.grey,
          ),
          tooltip: 'wifi',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.print,
            color: Colors.grey,
          ),
          tooltip: 'orint',
          onPressed: () {
            // handle the press
            
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.message_outlined,
            color: Colors.blue,
          ),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
      ],
      //  title: Text("Woga" , style:TextStyle(color: Colors.blue)),
      title: Image.asset(
        "assets/images/woga.jpg",
        height: 50,
      ),
      centerTitle: true,
      // shape: CustomShapeBorder(),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black, opacity: 0.5),
    );
  }
}
