// import 'package:autocroft/pages/message.dart';
// import 'package:autocroft/pages/select_bonded_device_Page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text('connect to bluetooth'),
//       ),
//       body: SelectBondedDevicePage(
//         onCahtPage:(device1){
//           BluetoothDevice device = device1;
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context){
//             return ChatPage(server: device);
//           }));
//         }
//       ),
//     );
//   }
// }