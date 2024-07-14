import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future createLocalFileOnFirebase(
  BuildContext context, {
  required String? localFilePath,
  required List<int>? localFileBytes,
}) async {
  String? localFileFirebaseStorageDownloadUrl;

  // upload local file to Firebase Storage
  localFileFirebaseStorageDownloadUrl =
      await actions.uploadLocalFileToFirebaseStorage(
    functions.getFirebaseStoragePath(localFilePath)!,
    localFileBytes!.toList(),
  );
  // create Firestore `file` Document

  await FilesRecord.collection.doc().set({
    ...createFilesRecordData(
      ownerRef: currentUserReference,
      fileUrl: localFileFirebaseStorageDownloadUrl,
      isDeleted: false,
      fileName: localFilePath,
      createdAt: getCurrentTimestamp,
      fileType: FileType.UNKNOWN,
    ),
    ...mapToFirestore(
      {
        'read_allowed': [currentUserReference?.id],
        'write_allowed': [currentUserReference?.id],
      },
    ),
  });
}
