// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:mobile_scanner/mobile_scanner.dart';

Future<String> scanQR(BuildContext context) {
  return Navigator.of(context).push<String>(
    MaterialPageRoute(builder: (context) {
      return Stack(
        children: [
          MobileScanner(
            onDetect: (barcode, args) {
              Navigator.pop(context, barcode.rawValue);
            },
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(
              bottom: 35.0,
              left: 25.0,
            ),
            child: IconButton(
              onPressed: () {
                scannerController
                  ..stop()
                  ..dispose();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_outlined,
                size: 40.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }),
  );
}
