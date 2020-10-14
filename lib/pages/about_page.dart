import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kachculator/widgets/mp_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  static String id = '/about';
  final String about;
  final String history;
  final String version;

  AboutPage({this.about, this.history, this.version});

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // String about;

    return mpScaffold(
      appBar: mpAppBar(
          context: context,
          title: Text('About'),
          button: mpLinkButton(
            label: 'Licenses',
            onPressed: () => showLicensePage(
                context: context,
                applicationVersion: this.version,
                applicationLegalese: '© Denis Filonov'),
          )),
      body: SafeArea(
        child: Markdown(
          data: about + '\n' + history,
          controller: controller,
          selectable: false,
          styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
          onTapLink: (href) => launch(href),
        ),
      ),
    );
  }
}

// Container(
//   height: 260.0,
//   // constraints: BoxConstraints(maxWidth: 800.0),
//   child: FutureBuilder(
//       future: rootBundle.loadString("text/$myLocale/about.md"),
//       builder:
//           (BuildContext context, AsyncSnapshot<String> snapshot) {
//         if (snapshot.hasData) {
//           return Markdown(
//             data: snapshot.data,
//             controller: controller,
//             selectable: false,
//             styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
//             onTapLink: (href) => launch(href),
//           );
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }),
// ),
