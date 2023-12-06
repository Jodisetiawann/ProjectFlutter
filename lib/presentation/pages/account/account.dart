import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsState();
}

class _AccountsState extends State<AccountsPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.ikea.co.id'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Our Store'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
