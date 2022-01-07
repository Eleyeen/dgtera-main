import 'package:dgtera_tablet_app/pages/login.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/transferTable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarScreen extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  // String text;

  AppBarScreen() : preferredSize = Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context,) {
    return AppBar(
      actions: [
        IconButton(
          
          icon: const Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          tooltip: 'End user',
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => TransferTable()));
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

