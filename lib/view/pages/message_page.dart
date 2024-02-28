import 'package:flutter/material.dart';
import 'package:state_management/data/static/fake_message.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({
    super.key,
    required this.chatt,
  });
  final Chatt chatt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatt.username),
      ),
    );
  }
}
