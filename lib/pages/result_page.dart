import 'package:flutter/material.dart';
import 'package:kachculator/widgets/multiplatform_widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ResultPage extends StatelessWidget {
  static String id = '/result';
  final String? result;
  final String? title;
  final controller = ScrollController();

  ResultPage({Key? key, required this.result, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(this.title!),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Markdown(
              data: this.result!,
              controller: controller,
              selectable: false,
              styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
            ),
          ),
        ),
      ),
    );
  }
}
