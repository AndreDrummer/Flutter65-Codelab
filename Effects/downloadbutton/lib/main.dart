import 'package:downloadbutton/download_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Download Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Apps(),
    ),
  );
}

class Apps extends StatefulWidget {
  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apps'),
      ),
      body: ListView(
        children: List.generate(20, (index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.android),
            ),
            title: Text('App $index'),
            subtitle: Text('Blá blá blá blá...'),
            trailing: _donwloadButton(),
          );
        }),
      ),
    );
  }

  Widget _donwloadButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: DonwloadButton(
        onCancel: () {},
        onDownload: () {},
        onOpen: () {},
        progress: 0.3,
        status: DownloadStatus.notDonwload,
      ),
    );
  }
}
