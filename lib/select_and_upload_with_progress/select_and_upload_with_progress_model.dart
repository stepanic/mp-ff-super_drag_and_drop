import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_and_upload_with_progress_widget.dart'
    show SelectAndUploadWithProgressWidget;
import 'package:flutter/material.dart';

class SelectAndUploadWithProgressModel
    extends FlutterFlowModel<SelectAndUploadWithProgressWidget> {
  ///  Local state fields for this page.

  int ii = 0;

  List<UploadingFileStruct> uploadingFiles = [];
  void addToUploadingFiles(UploadingFileStruct item) =>
      uploadingFiles.add(item);
  void removeFromUploadingFiles(UploadingFileStruct item) =>
      uploadingFiles.remove(item);
  void removeAtIndexFromUploadingFiles(int index) =>
      uploadingFiles.removeAt(index);
  void insertAtIndexInUploadingFiles(int index, UploadingFileStruct item) =>
      uploadingFiles.insert(index, item);
  void updateUploadingFilesAtIndex(
          int index, Function(UploadingFileStruct) updateFn) =>
      uploadingFiles[index] = updateFn(uploadingFiles[index]);

  List<UploadedFileStruct> uploadedFiles = [];
  void addToUploadedFiles(UploadedFileStruct item) => uploadedFiles.add(item);
  void removeFromUploadedFiles(UploadedFileStruct item) =>
      uploadedFiles.remove(item);
  void removeAtIndexFromUploadedFiles(int index) =>
      uploadedFiles.removeAt(index);
  void insertAtIndexInUploadedFiles(int index, UploadedFileStruct item) =>
      uploadedFiles.insert(index, item);
  void updateUploadedFilesAtIndex(
          int index, Function(UploadedFileStruct) updateFn) =>
      uploadedFiles[index] = updateFn(uploadedFiles[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - selectFilesWithAllowedExtensions] action in SelectFilesNUploadWithProgress widget.
  List<SelectedFileStruct>? selectedFiles;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
