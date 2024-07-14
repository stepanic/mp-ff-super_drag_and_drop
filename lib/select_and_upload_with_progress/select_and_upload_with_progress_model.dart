import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_and_upload_with_progress_widget.dart'
    show SelectAndUploadWithProgressWidget;
import 'package:flutter/material.dart';

class SelectAndUploadWithProgressModel
    extends FlutterFlowModel<SelectAndUploadWithProgressWidget> {
  ///  Local state fields for this page.

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

  int howManyUploadedFiles = 0;

  int howManySelectedFiles = 0;

  bool isOverSuperDragAndDrop = false;

  bool isUploadInProgress = false;

  int uploadedFileNextIndex = 0;

  int ii = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - selectFilesWithAllowedExtensions] action in SelectFilesControl widget.
  List<SelectedFileStruct>? selectedFiles;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    //LOCAL_START
    // Clean memory leaks
    if (selectedFiles != null) {
      for (int i = 0; i < selectedFiles!.length; i++) {
        selectedFiles![i].bytes = Uint8List.fromList([]);
      }
    }
    //LOCAL_END
    unfocusNode.dispose();
  }
}
