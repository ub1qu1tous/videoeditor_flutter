import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about.dart';
import 'package:flutter/cupertino.dart';

class ActivationPage extends StatelessWidget {
  ActivationPage({super.key});

  final TextEditingController _controller = TextEditingController();

  Future<void> getClipboardText() async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      _controller.text = clipboardData.text ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Color bgColor = Theme.of(context).colorScheme.surface == Colors.white ? Colors.grey.shade200 : Colors.grey.shade800;
    final Color hintColor =
        Theme.of(context).colorScheme.surface == Colors.white
            ? Colors.grey.shade600
            : Colors.grey.shade400;
    final Color fillColor =
        Theme.of(context).colorScheme.surface == Colors.white
            ? Colors.grey.shade300
            : Colors.grey.shade800;
    final Color foregroundColor =
        Theme.of(context).colorScheme.surface == Colors.white
            ? Colors.black
            : Colors.white;

    return Scaffold(
      // backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'License',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Paste your license key to start using the app.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                        color: hintColor), // Text color for dark background
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15, right: 19),
                        child: Icon(Icons.key, color: hintColor),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.content_paste, color: hintColor),
                        onPressed: getClipboardText,
                        tooltip: 'Paste the license key from clipboard',
                      ),
                      hintText: 'Enter License Key',
                      hintStyle: TextStyle(color: hintColor),
                      filled: true,
                      fillColor:
                          fillColor, // Background color for the TextField
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none, // Removes border line
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(
                    foregroundColor,
                  ),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  goToWebPage('https://pimosa.app/pricing');
                },
                child: Text('Buy license'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(
                    Colors.white,
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.blue,
                  ),
                ),
                // autofocus: true,
                onPressed: () {
                  // TODO: ADD DATABASE VALIDATION OF LICENSE KEY
                },
                child: Text('Validate key'),
              ),
            ]),
            SizedBox(height: 50),
            Text('Support links',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
            SizedBox(height: 5),
            Row(children: [
              Text('Activation limit error? visit docs',
                  style: TextStyle(color: Colors.grey)),
              IconButton(
                  onPressed: () {
                    goToWebPage(
                        'https://docs.pimosa.app/license/activation-limit-error');
                  },
                  icon: Icon(CupertinoIcons.link))
            ]),
            Row(children: [
              Text('How to find licence key?',
                  style: TextStyle(color: Colors.grey)),
              IconButton(
                  onPressed: () {
                    goToWebPage(
                        'https://docs.pimosa.app/license/how-to-find-license-key');
                  },
                  icon: Icon(CupertinoIcons.link))
            ]),
          ],
        ),
      ),
    );
  }
}
