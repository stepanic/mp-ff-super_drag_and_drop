import '/flutter_flow/flutter_flow_util.dart';
import 'f_f_drag_n_drop_widget.dart' show FFDragNDropWidget;
import 'package:flutter/material.dart';

class FFDragNDropModel extends FlutterFlowModel<FFDragNDropWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
