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

Future uploadSelectedFileAsStreamWithProgress(
  SelectedFileStruct selectedFile,
  int uploadedFileIndex,
  Future Function(double uploadProgress, int uploadedFileIndex)?
      onUploadProgress,
  Future Function(UploadedFileStruct uploadedFile, int uploadedFileIndex)
      onUploadSuccessful,
) async {
  // Add your function code here!

  print('upload radi as stream');

  onUploadProgress?.call(0, uploadedFileIndex);

  onUploadSuccessful(
      UploadedFileStruct(
        storagePath: 'storage.path',
        filePath: 'file.path.jpeg',
        uploadProgress: 1.0,
        storageDownloadUrl: 'storage.download.yrl',
        sizeInBytes: 1337,
      ),
      uploadedFileIndex);
}