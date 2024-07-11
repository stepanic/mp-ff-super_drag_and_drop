import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_and_upload_with_progress_widget.dart'
    show SelectAndUploadWithProgressWidget;
import 'package:flutter/material.dart';

class SelectAndUploadWithProgressModel
    extends FlutterFlowModel<SelectAndUploadWithProgressWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - selectFilesWithAllowedExtensions] action in Button widget.
  List<SelectedFileStruct>? selectedFiles;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
