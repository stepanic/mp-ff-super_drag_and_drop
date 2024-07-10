import '/components/select_file_control_widget.dart';
import '/components/select_files_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int ii = 0;

  int howManyUploadedFiles = 0;

  int howManySelectedFiles = 0;

  bool isOverSuperDragAndDrop = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SelectFiles component.
  late SelectFilesModel selectFilesModel;
  // Model for SelectFileControl component.
  late SelectFileControlModel selectFileControlModel;

  @override
  void initState(BuildContext context) {
    selectFilesModel = createModel(context, () => SelectFilesModel());
    selectFileControlModel =
        createModel(context, () => SelectFileControlModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    selectFilesModel.dispose();
    selectFileControlModel.dispose();
  }
}
