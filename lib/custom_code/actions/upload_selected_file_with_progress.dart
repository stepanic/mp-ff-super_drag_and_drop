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

Future<UploadedFileStruct?> uploadSelectedFileWithProgress(
  SelectedFileStruct selectedFile,
  Future Function(double? progress)? onProgress,
) async {
  // Add your function code here!

  String path = selectedFile.storagePath;
  Uint8List data = Uint8List.fromList(selectedFile.bytes);

  if (onProgress != null) {
    onProgress(0);
  }

  final storageRef = FirebaseStorage.instance.ref().child(path);
  final metadata = SettableMetadata(contentType: mime(path));
  final uploadTask = storageRef.putData(data, metadata);

  uploadTask.snapshotEvents.listen((event) {
    if (onProgress != null) {
      onProgress(event.bytesTransferred / event.totalBytes);
    }
  });

  final result = await uploadTask;

  result.

  final uploadedFile = UploadedFileStruct(
    localName: selectedFile.filePath,
    storageName: selectedFile.storagePath,
  );

  return result.state == TaskState.success ? result.ref.getDownloadURL() : null;
}
