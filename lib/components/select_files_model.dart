import '/flutter_flow/flutter_flow_util.dart';
import 'select_files_widget.dart' show SelectFilesWidget;
import 'package:flutter/material.dart';

class SelectFilesModel extends FlutterFlowModel<SelectFilesWidget> {
  ///  Local state fields for this component.

  int ii = 0;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
