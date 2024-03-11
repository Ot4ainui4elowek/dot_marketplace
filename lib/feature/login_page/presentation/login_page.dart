import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: theme.colorScheme.outline,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.translate,
              color: theme.colorScheme.outline,
            ),
            onPressed: () => 0,
          ),
        ],
      ),
      body: Padding(
        child: Column(
          children: [],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
