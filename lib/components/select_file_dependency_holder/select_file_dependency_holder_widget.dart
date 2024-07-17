import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_file_dependency_holder_model.dart';
export 'select_file_dependency_holder_model.dart';

class SelectFileDependencyHolderWidget extends StatefulWidget {
  const SelectFileDependencyHolderWidget({super.key});

  @override
  State<SelectFileDependencyHolderWidget> createState() =>
      _SelectFileDependencyHolderWidgetState();
}

class _SelectFileDependencyHolderWidgetState
    extends State<SelectFileDependencyHolderWidget> {
  late SelectFileDependencyHolderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectFileDependencyHolderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        final selectedFiles = await selectFiles(
          multiFile: true,
        );
        if (selectedFiles != null) {
          setState(() => _model.isDataUploading = true);
          var selectedUploadedFiles = <FFUploadedFile>[];

          var downloadUrls = <String>[];
          try {
            selectedUploadedFiles = selectedFiles
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                    ))
                .toList();

            downloadUrls = (await Future.wait(
              selectedFiles.map(
                (f) async => await uploadData(f.storagePath, f.bytes),
              ),
            ))
                .where((u) => u != null)
                .map((u) => u!)
                .toList();
          } finally {
            _model.isDataUploading = false;
          }
          if (selectedUploadedFiles.length == selectedFiles.length &&
              downloadUrls.length == selectedFiles.length) {
            setState(() {
              _model.uploadedLocalFiles = selectedUploadedFiles;
              _model.uploadedFileUrls = downloadUrls;
            });
          } else {
            setState(() {});
            return;
          }
        }
      },
      text: 'Select Files',
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              letterSpacing: 0.0,
            ),
        elevation: 3.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
