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
import 'dart:io';

Future uploadSelectedFileAsStreamWithProgress(
  SelectedFileStruct selectedFile,
  int uploadedFileIndex,
  Future Function(double uploadProgress, int uploadedFileIndex)?
      onUploadProgress,
  Future Function(UploadedFileStruct uploadedFile, int uploadedFileIndex)
      onUploadSuccessful,
  //LOCAL_START
  Stream<Uint8List> selectedFileStream,
  //LOCAL_END
) async {
  // Add your function code here!

  print('upload radi as stream 123');
  print(selectedFileStream);

  // onUploadProgress?.call(0, uploadedFileIndex);

  // onUploadSuccessful(
  //     UploadedFileStruct(
  //       storagePath: 'storage.path',
  //       filePath: 'file.path.jpeg',
  //       uploadProgress: 1.0,
  //       storageDownloadUrl: 'storage.download.yrl',
  //       sizeInBytes: 1337,
  //     ),
  //     uploadedFileIndex);

  String path = selectedFile.storagePath;
  // Uint8List data = Uint8List.fromList(selectedFile.bytes);
  //Cleanup Memory
  selectedFile.bytes = Uint8List.fromList([]);

  if (onUploadProgress != null) {
    onUploadProgress(0, uploadedFileIndex);
  }

  final storageRef = FirebaseStorage.instance.ref().child(path);
  final metadata = SettableMetadata(contentType: mime(path));
  // final uploadTask = storageRef.putData(data, metadata);
  String filePath = selectedFile.filePath;

  print('--------');
  // Path decode filePath
  print(filePath);
  filePath = Uri.decodeFull(filePath);

  // Replace spaces with `\ `
  // filePath = RegExp.escape(filePath);
  print(filePath);
  // filePath = filePath.replaceAll(' ', '\\ ');
  // filePath = filePath.replaceAll('\\', '\\\\');
  print('dva');

  print(filePath);

  // String escapeForPath(String path) {
  //   // Escape characters with special meaning in file paths
  //   return path.replaceAll(RegExp(r'[\\.]|\s|\(|\)'), r'\$&');
  // }

  // filePath = escapeForPath(filePath);
  print(filePath);
  print('--------3');

  // final file = File(selectedFile.filePath);

  final file = File(filePath);
  print(file.absolute.path);
  print('tri');
  print(file.absolute.existsSync());

  final uploadTask = storageRef.putFile(file, metadata);

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
        // data = Uint8List.fromList([]);
      });
    }
  });
}
