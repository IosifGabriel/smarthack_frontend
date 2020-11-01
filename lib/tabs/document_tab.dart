import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/tabs/institutii_tab.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../features/documents/documents.dart';

class DocumentTab extends StatefulWidget {
  DocumentTab({Key key}) : super(key: key);

  @override
  _DocumentTabState createState() => _DocumentTabState();
}

class _DocumentTabState extends State<DocumentTab> {
  DocumentService get documentService => GetIt.I.get<DocumentService>();

  bool _isLoading = true;
  ApiResponse<List<Document>> _apiResponse;

  @override
  void initState() {
    _fetchDocuments();
    super.initState();
  }

  void _fetchDocuments() async {
    setState(() => _isLoading = true);

    _apiResponse = await documentService.getDocuments();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              SmartButton(
                icon: FontAwesomeIcons.user,
                onPressed: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
            ],
          ),
          SmartHeadline('My documents'),
          Expanded(
            child: Builder(
              builder: (_) {
                // if (_isLoading) return SmartLoader();
                // if (_apiResponse.error)
                //   return SmartError(
                //     message: _apiResponse.errorMessage,
                //     errorCode: _apiResponse.errorCode,
                //   );
                // return DocumentsList(_apiResponse.data);
                return DocumentsList([
                  Document(
                    id: '1',
                    name: 'Carte de identitate',
                  ),
                  Document(
                    id: '2',
                    name: 'Permis conducere',
                  ),
                  Document(
                    id: '3',
                    name: 'Viza flotant',
                  ),
                  Document(
                    id: '4',
                    name: 'Viza flotant',
                  ),
                  Document(
                    id: '5',
                    name: 'Viza flotant',
                  ),
                ]);
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                child: RaisedButton(
                  color: Color.fromRGBO(255, 109, 64, 0.5),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                  padding: EdgeInsets.all(20),
                  child: Text("Adauga un document nou"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InstitutiiTab()),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
