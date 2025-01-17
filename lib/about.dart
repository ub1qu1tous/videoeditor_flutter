import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> goToWebPage(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}

var websiteUrl = 'pimosa.app';
var supportEmail = 'harshal@pimosa.app';
var twitter = 'x.com/craazyhv';
var discord = 'discord.gg';
var github = 'github.com/ub1qu1tous';
var docs = 'docs.pimosa.app';
var appVersion = '0.0.1';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
        children: [
      Column(children: [
        Padding(padding: const EdgeInsets.all(20)),
        Row(
          children: [
            Padding(padding: const EdgeInsets.only(left: 10)),
            Text(
              'About',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(padding: const EdgeInsets.only(bottom: 40)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                    width: 50, child: Icon(CupertinoIcons.globe, size: 20)),
                Text('Website'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  websiteUrl,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://pimosa.app');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(width: 50, child: Icon(CupertinoIcons.mail, size: 20)),
                Text('Support Email'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  supportEmail,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    // goToWebPage();
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                    width: 50,
                    child: Icon(FontAwesomeIcons.xTwitter, size: 20)),
                Text('Twitter/X Account'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  twitter,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://$twitter');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                    width: 50, child: Icon(FontAwesomeIcons.discord, size: 20)),
                Text('Discord server'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  discord,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://$discord');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.code,
                      size: 20,
                    )), // Spacing between icon and text
                Text('Github'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  github,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://$github');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Icon(
                    FontAwesomeIcons.file,
                    size: 20,
                  ),
                ), // Spacing between icon and text
                Text('Docs'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  docs,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://$docs');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Icon(Icons.info_outline, size: 20),
                ), // Spacing between icon and text
                Text('App Version'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  appVersion,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    // goToWebPage('https://pimosa.app');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(bottom: 40)),
        Row(
          children: [
            Text(
              'Powered by',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            )
          ],
        ),
        Padding(padding: const EdgeInsets.only(bottom: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Icon(
                    Icons.info_outline,
                    size: 20,
                  ),
                ), // Spacing between icon and text
                Text('FFmpeg'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  'ffmpeg.org',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://ffmpeg.org/');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left-aligned elements
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Icon(
                    Icons.info_outline,
                    size: 20,
                  ),
                ),
                Text('ImageMagick'),
              ],
            ),
            // Right-aligned elements
            Row(
              children: [
                Text(
                  'imagemagick.org',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8), // Spacing between text and icon
                IconButton(
                  onPressed: () {
                    goToWebPage('https://imagemagick.org/');
                  },
                  icon: Icon(CupertinoIcons.link),
                ),
              ],
            ),
          ],
        ),
        Divider(),
      ])
    ]);
  }
}
