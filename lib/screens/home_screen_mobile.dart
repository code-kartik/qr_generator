import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

TextEditingController linkController = TextEditingController();
String? qrData;

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "QR Generator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.amber),
              controller: linkController,
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent)),
                border: const OutlineInputBorder(),
                label: const Text('Enter URL'),
                labelStyle: const TextStyle(fontStyle: FontStyle.italic),
                prefixIcon: const Icon(Icons.link),
                prefixIconColor: Colors.amber,
                suffixIcon: IconButton(
                  onPressed: () => linkController.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber)),
            onPressed: () async {
              setState(() {
                qrData = linkController.text;
              });
            },
            child: const Text(
              "Generate QR",
              style: TextStyle(color: Colors.black),
            ),
          ),
          if (qrData != null)
            Expanded(
              child: Center(
                child: QrImageView(
                  data: qrData!,
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  version: QrVersions.auto,
                  size: 400,
                ),
              ),
            )
          else
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
