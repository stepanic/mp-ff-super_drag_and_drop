import '/flutter_flow/flutter_flow_util.dart';
import 'select_file_control_widget.dart' show SelectFileControlWidget;
import 'package:flutter/material.dart';

class SelectFileControlModel extends FlutterFlowModel<SelectFileControlWidget> {
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
