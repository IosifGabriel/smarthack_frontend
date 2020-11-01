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
      appBar: AppBar(title: Text('Documente')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Builder(
            builder: (_) {
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
                          builder: (context) =>
                              DocumentTemplateDetails(_apiResponse.data[index]),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

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
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding: EdgeInsets.all(20),
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
  DocumentTemplateService get documentTemplateService =>
      GetIt.I.get<DocumentTemplateService>();

  List<TextEditingController> _inputs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(widget.documentTemplate.name)),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textFields(widget.documentTemplate),
                  SmartButton(
                    icon: Icons.add,
                    text: 'Creeaza cerere document',
                    onPressed: () => _createRequest(),
                  ),
                ],
              )),
        ));
  }

  Widget _textFields(template) {
    widget.documentTemplate.fields = ['Nume', 'Prenume', 'Data'];

    List<Widget> fields = [];
    _inputs = [];
    for (int i = 0; i < widget.documentTemplate.fields.length; i++) {
      final controller = new TextEditingController();
      _inputs.add(controller);
      fields.add(
        SmartTextField(
          label: widget.documentTemplate.fields[i],
          controller: controller,
        ),
      );
      fields.add(SizedBox(height: 10));
    }
    return Column(children: [...fields]);
  }

  Future<void> _createRequest() async {
    Map<String, String> inputs = Map<String, String>();
    for (int i = 0; i < _inputs.length; i++) {
      inputs.putIfAbsent(widget.documentTemplate.fields[i], () => _inputs[i].text);
    }

    int institutionId = 1;
    var _apiResponse = await documentTemplateService.createRequest(inputs, institutionId, widget.documentTemplate.id);
    if (!_apiResponse.error) {
      Navigator.pushNamed(context, '/');
    }
  }
}
