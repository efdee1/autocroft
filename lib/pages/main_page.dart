// import 'package:autocroft/pages/home.dart';
// import 'package:autocroft/pages/select_bonded_device_Page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.pinkAccent,
//         title: Text('AUTOCROFT CONNECTOR',style: TextStyle(
//           color: Colors.black,
//         ),),
//       ),
//       body: FutureBuilder(
//         future: FlutterBluetoothSerial.instance.requestEnable(),
//         builder: (context, future) {
//           if (future.connectionState == ConnectionState.waiting){
//             return Scaffold(
//               body: Container(
//                 height: double.infinity,
//                 child: Center(
//                   child: Icon(Icons.bluetooth_disabled,
//                   size: 250,
//                   color: Colors.black,)
//                 ,),
//               ),
//             );
//           }else if (future.connectionState == ConnectionState.done){
//             return HomePage();
//           }else {
//             return HomePage();
//           }
//         },
//       ),
//     );
  
//   }
// }
 