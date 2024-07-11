import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'uploading_files_list_empty_placeholder_model.dart';
export 'uploading_files_list_empty_placeholder_model.dart';

class UploadingFilesListEmptyPlaceholderWidget extends StatefulWidget {
  const UploadingFilesListEmptyPlaceholderWidget({super.key});

  @override
  State<UploadingFilesListEmptyPlaceholderWidget> createState() =>
      _UploadingFilesListEmptyPlaceholderWidgetState();
}

class _UploadingFilesListEmptyPlaceholderWidgetState
    extends State<UploadingFilesListEmptyPlaceholderWidget> {
  late UploadingFilesListEmptyPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => UploadingFilesListEmptyPlaceholderModel());

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
