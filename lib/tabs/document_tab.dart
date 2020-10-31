import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmartHeadline('My documents'),
              SmartButton(
                icon: Icons.add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DocumentCreate()),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: Builder(builder: (_) {
              // if (_isLoading) return SmartLoader();
              // if (_apiResponse.error)
              //   return SmartError(
              //     message: _apiResponse.errorMessage,
              //     errorCode: _apiResponse.errorCode,
              //   );
              // return DocumentsList(_apiResponse.data);
              return DocumentsList([
                Document(id: '1', name: 'test 1', description: "desc"),
                Document(id: '2', name: 'test 2', description: "desc"),
                Document(id: '3', name: 'test 3', description: "desc"),
              ]);
            }),
          ),
        ],
      ),
    );
  }
}
