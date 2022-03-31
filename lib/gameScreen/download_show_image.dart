import 'package:flutter/material.dart';

import '../shared_pref.dart';

class ShowImage extends StatelessWidget {
  String path = "";
  double width = 250;
  double height = 250;
  ShowImage({Key? key, this.path = "", this.width = 250, this.height = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Shared.storagef.downloadURL(path),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
            return Container(width: width, height: height, child: CircularProgressIndicator());
          }
          return Container();
        });
  }
}
