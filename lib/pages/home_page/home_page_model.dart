import '/components/select_files_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int ii = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SelectFiles component.
  late SelectFilesModel selectFilesModel;

  @override
  void initState(BuildContext context) {
    selectFilesModel = createModel(context, () => SelectFilesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    selectFilesModel.dispose();
  }
}
