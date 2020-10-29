import 'package:flutter/material.dart';
import 'package:smarthack_frontend/components/components.dart';

class SmartError extends StatelessWidget {
  const SmartError({
    this.message,
    this.errorCode,
    Key key,
  }) : super(key: key);

  final String message;
  final int errorCode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 36),
          SizedBox(height: 10),
          errorCode != null ? SmartText('Code: $errorCode') : SizedBox.shrink(),
          SmartText(message),
        ],
      ),
    );
  }
}
