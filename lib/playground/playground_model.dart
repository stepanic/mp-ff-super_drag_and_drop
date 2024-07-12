import '/flutter_flow/flutter_flow_util.dart';
import 'playground_widget.dart' show PlaygroundWidget;
import 'package:flutter/material.dart';

class PlaygroundModel extends FlutterFlowModel<PlaygroundWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
