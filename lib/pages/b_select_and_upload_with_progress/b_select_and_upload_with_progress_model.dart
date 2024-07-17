import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/uploaded_files_list_empty_placeholder/uploaded_files_list_empty_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'b_select_and_upload_with_progress_widget.dart'
    show BSelectAndUploadWithProgressWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BSelectAndUploadWithProgressModel
    extends FlutterFlowModel<BSelectAndUploadWithProgressWidget> {
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
    unfocusNode.dispose();
  }
}
