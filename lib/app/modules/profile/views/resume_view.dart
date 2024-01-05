import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';

class ResumeView extends StatefulWidget {
  ResumeView({this.pdfUrl});
  String? pdfUrl;

  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProfileController>();

   InAppWebViewController _webViewController;

    return Scaffold(
      appBar: AppBar(
          title: Text('Resume View', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close, color: Colors.black),
          )),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.pdfUrl!)),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
