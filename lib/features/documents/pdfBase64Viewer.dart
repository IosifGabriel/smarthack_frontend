import 'dart:async'; // asynchroneous function (await)
import 'dart:io'; // write the file on user's phone
import 'dart:convert'; // handle base64 decoding
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
    createFileOfPdfUrl(widget.data).then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }

  Future<File> createFileOfPdfUrl(is_base_64) async {
    final url = "http://africau.edu/images/default/sample.pdf";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin example app')),
      body: Center(
        child: RaisedButton(
          child: Text("Open PDF"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
          ),
        ),
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

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
