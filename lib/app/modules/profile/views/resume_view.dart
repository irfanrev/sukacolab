import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/profile/controllers/profile_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ResumeView extends StatelessWidget {
  ResumeView({this.pdfUrl});
  String? pdfUrl;

  @override
  Widget build(BuildContext context) {

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
      body: Container(
        child: SfPdfViewer.network(
          pdfUrl!,
        ),
      ),
    );
  }
}
