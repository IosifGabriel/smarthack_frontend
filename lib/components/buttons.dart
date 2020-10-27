import 'package:flutter/material.dart';

class SmartButton extends StatelessWidget {
  const SmartButton({
    this.icon,
    this.text,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : SizedBox.shrink(),
            icon != null && text != null
                ? SizedBox(width: 10)
                : SizedBox.shrink(),
            text != null
                ? Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class SmartTextButton extends StatelessWidget {
  const SmartTextButton({
    this.text,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
