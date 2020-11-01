import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/tabs/institutii_tab.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../features/documents/documents.dart';

class DocumentTemplateTab extends StatefulWidget {
  DocumentTemplateTab({Key key}) : super(key: key);

  @override
  _DocumentTemplateTabState createState() => _DocumentTemplateTabState();
}

class _DocumentTemplateTabState extends State<DocumentTemplateTab> {
  DocumentTemplateService get documentTemplateService =>
      GetIt.I.get<DocumentTemplateService>();

  bool _isLoading = true;
  ApiResponse<List<DocumentTemplate>> _apiResponse;

  @override
  void initState() {
    _fetchDocuments();
    super.initState();
  }

  void _fetchDocuments() async {
    setState(() => _isLoading = true);

    _apiResponse = await documentTemplateService.getDocumentTemplates();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmartHeadline('Documente'),
                ],
              ),
              Expanded(
                child: Builder(builder: (_) {
                  if (_isLoading) return SmartLoader();
                  if (_apiResponse.error)
                    return SmartError(
                      message: _apiResponse.errorMessage,
                      errorCode: _apiResponse.errorCode,
                    );
                  return ListView.builder(
                    itemCount: _apiResponse.data.length,
                    itemBuilder: (context, index) {
                      return DocumentTemplateListItem(
                        _apiResponse.data[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DocumentTemplateDetails(
                                  _apiResponse.data[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        )));
  }
}

// class DocumentTemplateDetails {}

// class DocumentTemplateList extends StatefulWidget {
//   DocumentTemplateList(
//     this.documents, {
//     Key key,
//   }) : super(key: key);

//   final List<Document> documents;

//   @override
//   _DocumentTemplateListState createState() => _DocumentTemplateListState();
// }

// class _DocumentTemplateListState extends State<DocumentTemplateList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.documents.length,
//       itemBuilder: (context, index) {
//         return DocumentListItem(
//           widget.documents[index],
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       DocumentTemplateDetails(widget.documents[index])),
//             );
//           },
//         );
//       },
//     );
//   }
// }

class DocumentTemplateListItem extends StatelessWidget {
  const DocumentTemplateListItem(
    this.documentTemplate, {
    this.onTap,
    Key key,
  }) : super(key: key);

  final DocumentTemplate documentTemplate;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white24))),
                child: Icon(Icons.autorenew, color: Colors.white),
              ),
              title: Text(
                documentTemplate.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      ),
    );
  }
}

class DocumentTemplateDetails extends StatefulWidget {
  DocumentTemplateDetails(
    this.documentTemplate, {
    Key key,
  }) : super(key: key);

  final DocumentTemplate documentTemplate;

  @override
  _DocumentTemplateDetailsState createState() =>
      _DocumentTemplateDetailsState();
}

class _DocumentTemplateDetailsState extends State<DocumentTemplateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: _fields(widget.documentTemplate)),
        ));
  }

  Widget _fields(template) {
    List<Widget> fields = [];
    for (int i = 1; i <= 4; i++) {
      fields.add(Text('aaa'));
    }
    return Column(children: [...fields]);
  }
}
