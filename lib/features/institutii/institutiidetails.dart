import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/features/documents/pdfBase64Viewer.dart';
import 'package:smarthack_frontend/models/institutii.dart';
import 'package:smarthack_frontend/services/services.dart';
import 'institutii.dart';
import '../../models/models.dart';
import '../../components/components.dart';

class InstitutiiDetails extends StatefulWidget {
  InstitutiiDetails(
    this.document, {
    Key key,
  }) : super(key: key);

  final Institutii document;

  @override
  _InstitutiiDetailsState createState() => _InstitutiiDetailsState();
}

class _InstitutiiDetailsState extends State<InstitutiiDetails> {
  InstitutiiService get documentService => GetIt.I.get<InstitutiiService>();

  bool _isLoading = true;
  ApiResponse<String> _apiResponse;

  @override
  void initState() {
    _fetchInstitutiis();
    super.initState();
  }

  void _fetchInstitutiis() async {
    setState(() => _isLoading = true);

    // _apiResponse = await documentService.getPDF();

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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => InstitutiiEdit(widget.document)),
                // );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return InstitutiiDelete(widget.document);
                //   },
                // );
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
