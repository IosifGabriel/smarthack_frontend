import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/components/error.dart';
import 'package:smarthack_frontend/components/loader.dart';
import 'package:smarthack_frontend/features/institutii/institutiilist.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../features/documents/documents.dart';

class InstitutiiTab extends StatefulWidget {
  InstitutiiTab({Key key}) : super(key: key);

  @override
  _InstitutiiTabState createState() => _InstitutiiTabState();
}

class _InstitutiiTabState extends State<InstitutiiTab> {
  InstitutiiService get institutiiService => GetIt.I.get<InstitutiiService>();

  bool _isLoading = true;
  ApiResponse<List<Institutii>> _apiResponse;

  @override
  void initState() {
    _fetchInstitutiis();
    super.initState();
  }

  void _fetchInstitutiis() async {
    setState(() => _isLoading = true);

    _apiResponse = await institutiiService.getInstitutii();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Institutii"),
        ),
        body: Builder(builder: (_) {
          if (_isLoading) return SmartLoader();
          if (_apiResponse.error)
            return SmartError(
              message: _apiResponse.errorMessage,
              errorCode: _apiResponse.errorCode,
            );
          return InstitutiisList(_apiResponse.data);
        }));
  }
}
