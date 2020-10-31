import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/features/documents/pdfBase64Viewer.dart';
import 'package:smarthack_frontend/services/services.dart';
import 'documents.dart';
import '../../models/models.dart';
import '../../components/components.dart';

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
  DocumentService get documentService => GetIt.I.get<DocumentService>();

  bool _isLoading = true;
  ApiResponse<String> _apiResponse;

  @override
  void initState() {
    _fetchDocuments();
    super.initState();
  }

  void _fetchDocuments() async {
    setState(() => _isLoading = true);

    _apiResponse = await documentService.getPDF();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DocumentEdit(widget.document)),
                );
              },
            ),
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
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Text("Nume document: Carte de identitate"),
                Text("Data eliberarii: 11.12.2014"),
                Text("Data expirarii: 5.5.2023"),
                SizedBox(width: 30),
                PdfBase64Viewer(_apiResponse.data)
              ],
            ),
          ),
        ));
  }
}