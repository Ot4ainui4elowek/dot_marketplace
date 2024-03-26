import 'package:flutter/material.dart';

class RecoveryNewPasswordPage extends StatefulWidget {
  const RecoveryNewPasswordPage({super.key});

  @override
  State<RecoveryNewPasswordPage> createState() =>
      _RecoveryNewPasswordPageState();
}

class _RecoveryNewPasswordPageState extends State<RecoveryNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new pass'),
      ),
    );
  }
}
