// // ignore: file_names
// // ignore: file_names
// import 'dart:async';

// import 'package:autocroft/pages/device_list_entry.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// class SelectBondedDevicePage extends StatefulWidget {
//   /// If true, on page start there is performed discovery upon the bonded devices.
//   /// Then, if they are not avaliable, they would be disabled from the selection.
//   final bool checkAvailability;
//   final Function onCahtPage;

//   const SelectBondedDevicePage(
//       {this.checkAvailability = true, required this.onCahtPage});

//   @override
//   _SelectBondedDevicePage createState() => new _SelectBondedDevicePage();
// }

// enum _DeviceAvailability {
//   no,
//   maybe,
//   yes,
// }

// class _DeviceWithAvailability {
//   BluetoothDevice device;
//   _DeviceAvailability availability;
//   int? rssi;

//   _DeviceWithAvailability(this.device, this.availability, [this.rssi]);
// }

// class _SelectBondedDevicePage extends State<SelectBondedDevicePage> {
//   // ignore: deprecated_member_use
//   List<_DeviceWithAvailability> devices =<_DeviceWithAvailability>[];

//   // List<_DeviceWithAvailability>.empty(growable: true);

//   // Availability
//   StreamSubscription<BluetoothDiscoveryResult>? _discoveryStreamSubscription;
//  late  bool _isDiscovering;

//   _SelectBondedDevicePage();

//   @override
//   void initState() {
//     super.initState();

//     _isDiscovering = widget.checkAvailability;

//     if (_isDiscovering) {
//       _startDiscovery();
//     }

//     // Setup a list of the bonded devices
//     FlutterBluetoothSerial.instance
//         .getBondedDevices()
//         .then((List<BluetoothDevice> bondedDevices) {
//       setState(() {
//         devices = bondedDevices
//             .map(
//               (device) => _DeviceWithAvailability(
//                 device,
//                 widget.checkAvailability
//                     ? _DeviceAvailability.maybe
//                     : _DeviceAvailability.yes,
//               ),
//             )
//             .toList();
//       });
//     });
//   }

//   void _restartDiscovery() {
//     setState(() {
//       _isDiscovering = true;
//     });

//     _startDiscovery();
//   }

//   void _startDiscovery() {
//     _discoveryStreamSubscription =
//         FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
//       setState(() {
//         Iterator i = devices.iterator;
//         while (i.moveNext()) {
//           var _device = i.current;
//           if (_device.device == r.device) {
//             _device.availability = _DeviceAvailability.yes;
//             _device.rssi = r.rssi;
//           }
//         }
//       });
//     });

//     _discoveryStreamSubscription?.onDone(() {
//       setState(() {
//         _isDiscovering = false;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // Avoid memory leak (`setState` after dispose) and cancel discovery
//     _discoveryStreamSubscription?.cancel();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<BluetoothDeviceListEntry> list = devices
//         .map((_device) => BluetoothDeviceListEntry(
//               device: _device.device,
//               rssi: _device.rssi,
//               enabled: _device.availability == _DeviceAvailability.yes,
//               onTap: () {
//                  widget.onCahtPage(_device.device);
//                 Navigator.of(context).pop(_device.device);
//               },
//             ))
//         .toList();
//         return ListView(
//           children: list,
//         );


// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Select device'),
// //         actions: <Widget>[
// //           _isDiscovering
// //               ? FittedBox(
// //                   child: Container(
// //                     margin: new EdgeInsets.all(16.0),
// //                     child: CircularProgressIndicator(
// //                       valueColor: AlwaysStoppedAnimation<Color>(
// //                         Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 )
// //               : IconButton(
// //                   icon: Icon(Icons.replay),
// //                   onPressed: _restartDiscovery,
// //                 )
// //         ],
// //       ),
// //       body: ListView(children: list),
// //     );
//    }
//  }
