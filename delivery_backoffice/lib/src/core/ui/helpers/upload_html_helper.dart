import 'dart:html';

import 'package:flutter/services.dart';

typedef UploadCallback = void Function(Uint8List file, String fineName);

class UploadHtmlHelper {
  void startUpload(UploadCallback callback){
    final uploadInput = FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((_) { 
      handleFileUpload(uploadInput, callback);
    });
  }

  void handleFileUpload(){}
}