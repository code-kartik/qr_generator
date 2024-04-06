import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

TextEditingController linkController = TextEditingController();
String? qrData;

class _HomeScreenWebState extends State<HomeScreenWeb> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 700.0, vertical: 16.0),
              child: TextField(
                style: const TextStyle(color: Colors.amber),
                controller: linkController,
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Enter String',
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
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
              ),
              onPressed: () async {
                setState(() {
                  qrData = linkController.text;
                });
                if (qrData != null) {
                  _showQRCodeDialog(); // Call custom dialog function
                }
              },
              child: const Text(
                "Generate QR",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom function to show QR code dialog
  void _showQRCodeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.amber,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: QrImageView(
              data: qrData!,
              size: 600,
              foregroundColor: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
