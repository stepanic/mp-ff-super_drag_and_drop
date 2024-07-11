import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'uploaded_files_list_empty_placeholder_model.dart';
export 'uploaded_files_list_empty_placeholder_model.dart';

class UploadedFilesListEmptyPlaceholderWidget extends StatefulWidget {
  const UploadedFilesListEmptyPlaceholderWidget({super.key});

  @override
  State<UploadedFilesListEmptyPlaceholderWidget> createState() =>
      _UploadedFilesListEmptyPlaceholderWidgetState();
}

class _UploadedFilesListEmptyPlaceholderWidgetState
    extends State<UploadedFilesListEmptyPlaceholderWidget> {
  late UploadedFilesListEmptyPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => UploadedFilesListEmptyPlaceholderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        'Please select files for upload',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
