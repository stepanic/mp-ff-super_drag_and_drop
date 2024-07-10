import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'select_file_control_model.dart';
export 'select_file_control_model.dart';

class SelectFileControlWidget extends StatefulWidget {
  const SelectFileControlWidget({super.key});

  @override
  State<SelectFileControlWidget> createState() =>
      _SelectFileControlWidgetState();
}

class _SelectFileControlWidgetState extends State<SelectFileControlWidget> {
  late SelectFileControlModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectFileControlModel());

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
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            // upload to Firebase Storage
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
                  fileType: FileType.UNKNOWN,
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
            // update page

            _model.updatePage(() {});
          },
          child: Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color(0x4095A1AC),
                width: 2.0,
              ),
            ),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: const Icon(
              Icons.upload,
              color: Color(0x4095A1AC),
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
