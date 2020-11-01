import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:smarthack_frontend/services/services.dart';
import 'documents.dart';
import '../../models/models.dart';
import '../../components/components.dart';
import 'dart:convert';

class DocumentDetails extends StatefulWidget {
  DocumentDetails(
    this.document, {
    Key key,
  }) : super(key: key);

  final Document document;

  @override
  _DocumentDetailsState createState() => _DocumentDetailsState();
}

class _DocumentDetailsState extends State<DocumentDetails> {
  bool _isLoading = true;
  List<Widget> _pdfPages;

  @override
  void initState() {
    _loadDocument();
    super.initState();
  }

  void _loadDocument() async {
    setState(() => _isLoading = true);

    await _getPdf(widget.document.documentBlob);

    setState(() => _isLoading = false);
  }

  Future<void> _getPdf(String data) async {
    List<int> pdfDataBytes = base64.decode(data);
    PdfDocument doc = await PdfDocument.openData(pdfDataBytes);

    _pdfPages = [];
    for (int i = 1; i <= doc.pageCount; i++) {
      PdfPage page = await doc.getPage(i);
      PdfPageImage pageImage = await page.render();
      await pageImage.createImageIfNotAvailable();
      Widget image = RawImage(
        image: pageImage.imageIfAvailable,
        fit: BoxFit.contain,
      );
      _pdfPages.add(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DocumentDelete(widget.document);
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Builder(
            builder: (_) {
              if (_isLoading) return SmartLoader();
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.document.name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Data eliberarii: ${widget.document.releaseDate}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Data expirarii: ${widget.document.expirationDate}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Column(children: [..._pdfPages]),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
