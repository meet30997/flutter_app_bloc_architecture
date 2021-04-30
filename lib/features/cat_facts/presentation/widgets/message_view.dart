import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final String message;
  final bool isError;

  const MessageView({
    Key key,
    @required this.message,
    @required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      style:
          TextStyle(fontSize: 20, color: isError ? Colors.red : Colors.green),
      textAlign: TextAlign.center,
    ));
  }
}
