import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/features/documents/pdfBase64Viewer.dart';
import 'package:smarthack_frontend/models/institutii.dart';
import 'package:smarthack_frontend/services/services.dart';
import 'package:smarthack_frontend/tabs/documents_template_tab.dart';
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
  @override
  Widget build(BuildContext context) {
    return DocumentTemplateTab();
  }
}
