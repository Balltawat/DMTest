import 'package:flutter/material.dart';
import 'package:swiftdynamicstest/datastorage.dart';
import 'package:swiftdynamicstest/main.dart';
import 'package:swiftdynamicstest/calculator.dart';
import 'package:swiftdynamicstest/stepperform.dart';

// Widget appbarmenu(String title) {
//   return AppBar(
//     backgroundColor: Color(0xFF326ABA),
//     automaticallyImplyLeading: false, //back button
//     title: Text(
//       title,
//       style: TextStyle(
//         fontSize: 25.0,
//         color: Colors.white,
//       ),
//     ),
//     centerTitle: true,
//   );
// }

AppBar appbarmenu(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Color(0xFF326ABA),
    automaticallyImplyLeading: false, //back button
    title: Text(
      title,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
    ),
    // centerTitle: true,
    actions: [
      PopupMenuButton(
        icon: Icon(Icons.menu), //don't specify icon if you want 3 dot menu
        color: Colors.blue,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            value: 0,
            child: Text(
              "To Do List",
              style: TextStyle(color: Colors.white),
            ),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text(
              "Calculator",
              style: TextStyle(color: Colors.white),
            ),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: Text(
              "เก็บข้อมูล",
              style: TextStyle(color: Colors.white),
            ),
          ),
          PopupMenuItem<int>(
            value: 3,
            child: Text(
              "Stepper Form",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        onSelected: (item) {
          switch (item) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: title),
                  ));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Calculator()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataStorage()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StepperForm()));
              break;
            default:
              break;
          }
        },
      ),
    ],
  );
}

// AlertDialog alertbox(String name) {
//   print('object');
//   return AlertDialog(
//       title: Text('รายละเอียดข้อมูล'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Text(name),
//             Text('Would you like to approve of this message?'),
//           ],
//         ),
//       ));
// }
