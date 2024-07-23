import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart'; // Assurez-vous que ce fichier contient vos données

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Conversion de String à Uri
    if (!await launch(
      uri.toString(),
      // avec ces deux propiete on n'ouvre plus les liens dans le navigateur mais sur le web page de l'app
      forceWebView: true,
      enableJavaScript: true,
      statusBarBrightness: Brightness.light,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.map((item) {
        return Card(
          child: ListTile(
            onTap: () => _launchURL(item['url']),
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 240, 239, 239),
              child: FaIcon(
                item['icon'],
                color: item['color'],
                size: 25,
              ),
            ),
            title: Text(
              item['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(item['url']),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => _launchURL(item['url']),
            ),
          ),
        );
      }).toList(),
    );
  }
}
