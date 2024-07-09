import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'select_files_model.dart';
export 'select_files_model.dart';

class SelectFilesWidget extends StatefulWidget {
  const SelectFilesWidget({super.key});

  @override
  State<SelectFilesWidget> createState() => _SelectFilesWidgetState();
}

class _SelectFilesWidgetState extends State<SelectFilesWidget> {
  late SelectFilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectFilesModel());

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
        // select files and upload to Firestore
        final selectedFiles = await selectFiles(
          allowedExtensions: ['mp3'],
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

        // i=0
        _model.ii = 0;
        while (_model.ii < _model.uploadedFileUrls.length) {
          // create Firestore `file` Document

          await FilesRecord.collection.doc().set({
            ...createFilesRecordData(
              ownerRef: currentUserReference,
              fileUrl: _model.uploadedFileUrls[_model.ii],
              isDeleted: false,
              fileName: '<FILE_NAME>',
              createdAt: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'read_allowed': [currentUserReference?.id],
                'write_allowed': [currentUserReference?.id],
              },
            ),
          });
          // i+=1
          _model.ii = _model.ii + 1;
        }
      },
      text: 'Select files',
      options: FFButtonOptions(
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              letterSpacing: 0.0,
            ),
        elevation: 3.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
