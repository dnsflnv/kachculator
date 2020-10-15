import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class IfpPage extends StatelessWidget {
  static String id = '/ifp';

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(title: Text('IFP')),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Text('IFP description'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
