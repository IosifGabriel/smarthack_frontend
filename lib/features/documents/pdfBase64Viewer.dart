import 'dart:async'; // asynchroneous function (await)
import 'dart:io'; // write the file on user's phone
import 'dart:convert'; // handle base64 decoding
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class PdfBase64Viewer extends StatefulWidget {
  final String data;

  const PdfBase64Viewer(String this.data);
  @override
  _PdfBase64ViewerState createState() => new _PdfBase64ViewerState();
}

class _PdfBase64ViewerState extends State<PdfBase64Viewer> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    _createFileFromString(widget.data).then((path) {
      setState(() {
        pathPDF = path;
        print(pathPDF);
      });
    });
  }

  Future<String> _createFileFromString(String encodedStr) async {
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}
