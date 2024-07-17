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

//LOCAL_START
// import '/flutter_flow/upload_data.dart';
import '/flutter_flow/upload_data.ffhr.dart';
//LOCAL_END

Future<List<SelectedFileStruct>?> selectFilesWithAllowedExtensions(
  List<String>? allowedExtensions,
  bool? isMultiFile,
) async {
  final selectedFiles = await selectFiles(
    allowedExtensions: allowedExtensions,
    multiFile: isMultiFile ?? false,
  );

  List<SelectedFileStruct> selectedFilesList = <SelectedFileStruct>[];

  if (selectedFiles != null) {
    for (var i = 0; i < selectedFiles.length; i++) {
      SelectedFile selectedFile = selectedFiles[i];

      selectedFilesList.add(SelectedFileStruct(
        storagePath: selectedFile.storagePath,
        filePath: selectedFile.filePath,
        bytes: selectedFile.bytes,
      ));
    }

    return selectedFilesList;
  }
  return null;
}
