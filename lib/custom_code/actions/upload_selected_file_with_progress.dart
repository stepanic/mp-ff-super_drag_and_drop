// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:io';

Future uploadSelectedFileWithProgress(
  SelectedFileStruct selectedFile,
  int uploadedFileIndex,
  Future Function(double uploadProgress, int uploadedFileIndex)?
      onUploadProgress,
  Future Function(UploadedFileStruct uploadedFile, int uploadedFileIndex)
      onUploadSuccessful,
) async {
  // Add your function code here!

  String path = selectedFile.storagePath;
  Uint8List data = Uint8List.fromList([]);
  bool isUploadAsStream = true;
  if (selectedFile.hasBytes()) {
    data = Uint8List.fromList(selectedFile.bytes);
    isUploadAsStream = false;
  }
  //Cleanup Memory
  selectedFile.bytes = Uint8List.fromList([]);

  if (onUploadProgress != null) {
    onUploadProgress(0, uploadedFileIndex);
  }

  final storageRef = FirebaseStorage.instance.ref().child(path);
  final metadata = SettableMetadata(contentType: mime(path));

  UploadTask uploadTask;
  // Upload the file as stream is much memory efficient
  if (isUploadAsStream) {
    String filePath = selectedFile.filePath;
    filePath = Uri.decodeFull(filePath);
    final file = File(filePath);
    uploadTask = storageRef.putFile(file, metadata);
  } else {
    // Upload as byte array it makes sense if the file should be preview locally
    uploadTask = storageRef.putData(data, metadata);
  }

  uploadTask.snapshotEvents.listen((event) {
    // print(event.state);

    if (onUploadProgress != null && event.totalBytes > 0) {
      double progress = event.bytesTransferred / event.totalBytes;
      // print(progress);
      onUploadProgress(progress, uploadedFileIndex);
    }

    if (event.state == TaskState.success) {
      event.ref.getDownloadURL().then((downloadUrl) {
        int sizeInBytes = event.totalBytes;
        onUploadSuccessful(
          UploadedFileStruct(
            storagePath: selectedFile.storagePath,
            filePath: Uri.decodeFull(selectedFile.filePath),
            uploadProgress: 1.0,
            storageDownloadUrl: downloadUrl,
            sizeInBytes: sizeInBytes,
          ),
          uploadedFileIndex,
        );
        data = Uint8List.fromList([]);
      });
    }
  });
}
