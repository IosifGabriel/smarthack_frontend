import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthack_frontend/models/models.dart';
import 'package:smarthack_frontend/services/services.dart';
import '../components/components.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountService get accountService => GetIt.I.get<AccountService>();

  bool _isLoading = true;
  ApiResponse<User> _apiResponse;

  @override
  void initState() {
    _fetchDocuments();
    super.initState();
  }

  void _fetchDocuments() async {
    setState(() => _isLoading = true);

    _apiResponse = await accountService.getUser();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(53, 66, 86, 1.0),
      appBar: AppBar(),
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
              return Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SmartAvatar('AS'),
                        SizedBox(height: 20),
                        SmartHeadline(
                            '${_apiResponse.data.firstName} ${_apiResponse.data.lastName}'),
                      ],
                    ),
                    SizedBox(height: 20),
                    SmartText('${_apiResponse.data.email}'),
                    SizedBox(height: 20),
                    SmartText('CNP:  ${_apiResponse.data.cnp}'),
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
