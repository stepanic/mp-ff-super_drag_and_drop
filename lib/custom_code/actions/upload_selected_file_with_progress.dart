// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime_type/mime_type.dart';

Future uploadSelectedFileWithProgress(
  SelectedFileStruct selectedFile,
  int selectedFileIndex,
  Future Function(double uploadProgress, int selectedFileIndex)?
      onUploadProgress,
  Future Function(UploadedFileStruct uploadedFile, int selectedFileIndex)
      onUploadSuccessful,
) async {
  // Add your function code here!

  String path = selectedFile.storagePath;
  Uint8List data = Uint8List.fromList(selectedFile.bytes);

  if (onUploadProgress != null) {
    onUploadProgress(0, selectedFileIndex);
  }

  final storageRef = FirebaseStorage.instance.ref().child(path);
  final metadata = SettableMetadata(contentType: mime(path));
  final uploadTask = storageRef.putData(data, metadata);

  uploadTask.snapshotEvents.listen((event) {
    print(event.state);

    if (onUploadProgress != null && event.totalBytes > 0) {
      double progress = event.bytesTransferred / event.totalBytes;
      print(progress);
      onUploadProgress(progress, selectedFileIndex);
    }

    if (event.state == TaskState.success) {
      event.ref.getDownloadURL().then((downloadUrl) {
        onUploadSuccessful(
          UploadedFileStruct(
            storagePath: selectedFile.storagePath,
            filePath: selectedFile.filePath,
            storageDownloadUrl: downloadUrl,
          ),
          selectedFileIndex,
        );
      });
    }
  });
}
