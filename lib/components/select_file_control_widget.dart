import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'select_file_control_model.dart';
export 'select_file_control_model.dart';

class SelectFileControlWidget extends StatefulWidget {
  const SelectFileControlWidget({
    super.key,
    this.onUploadProgressChange,
    required this.onUploadDone,
  });

  final Future Function(bool isUploadInProgress)? onUploadProgressChange;
  final Future Function(List<String> fileNames, List<String> fileUrls)?
      onUploadDone;

  @override
  State<SelectFileControlWidget> createState() =>
      _SelectFileControlWidgetState();
}

class _SelectFileControlWidgetState extends State<SelectFileControlWidget>
    with TickerProviderStateMixin {
  late SelectFileControlModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectFileControlModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: -1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // isUploadInProgress=true
          _model.isUploadInProgress = true;
          setState(() {});
          // onUploadProgressChange(true)
          await widget.onUploadProgressChange?.call(
            true,
          );
          // start rotating progress icon
          if (animationsMap['iconOnActionTriggerAnimation'] != null) {
            animationsMap['iconOnActionTriggerAnimation']!.controller
              ..reset()
              ..repeat();
          }
          // upload to Firebase Storage
          final selectedFiles = await selectFiles(
            //LOCAL_START
            // allowedExtensions: ['mp3'],
            allowedExtensions: [
              'mp3',
              'm4a',
              'oga',
              'aac',
              'wav',
              'opus',
              'flac'
            ],
            //LOCAL_END
            multiFile: true,
          );
          if (selectedFiles != null) {
            setState(() => _model.isDataUploading = true);
            var selectedUploadedFiles = <FFUploadedFile>[];

            var downloadUrls = <String>[];
            try {
              showUploadMessage(
                context,
                //LOCAL_START
                // 'Uploading file...',
                selectedFiles.length == 1
                    ? 'Uploading file...'
                    : 'Uploading files...',
                //LOCAL_END
                showLoading: true,
              );
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
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              _model.isDataUploading = false;
            }
            if (selectedUploadedFiles.length == selectedFiles.length &&
                downloadUrls.length == selectedFiles.length) {
              setState(() {
                _model.uploadedLocalFiles = selectedUploadedFiles;
                _model.uploadedFileUrls = downloadUrls;
              });
              showUploadMessage(
                context,
                'Success!',
              );
            } else {
              setState(() {});
              showUploadMessage(
                context,
                //LOCAL_START
                // 'Failed to upload file',
                selectedFiles.length == 1
                    ? 'Failed to upload file'
                    : 'Failed to upload files',
                //LOCAL_END
              );
              return;
            }
          }

          // onUploadDone
          await widget.onUploadDone?.call(
            FFAppState().EmptyList,
            _model.uploadedFileUrls,
          );
          // i=0
          _model.ii = 0;
          while (_model.ii < _model.uploadedFileUrls.length) {
            // create Firestore `file` Document

            await FilesRecord.collection.doc().set({
              ...createFilesRecordData(
                ownerRef: currentUserReference,
                fileUrl: _model.uploadedFileUrls[_model.ii],
                isDeleted: false,
                //LOCAL_START
                // fileName: '<FILE_NAME>',
                fileName: selectedFiles?[_model.ii].filePath?.split('/').last,
                //LOCAL_END
                createdAt: getCurrentTimestamp,
                //LOCAL_START
                // fileType: functions.getFileType('/path/a/b/file.mp3'),
                fileType:
                    functions.getFileType(selectedFiles?[_model.ii].filePath),
                //LOCAL_END
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
          // stop rotating progress icon
          if (animationsMap['iconOnActionTriggerAnimation'] != null) {
            animationsMap['iconOnActionTriggerAnimation']!.controller.stop();
          }
          // isUploadInProgress=false
          _model.isUploadInProgress = false;
          setState(() {});
          // Clear UploadData_SFCF
          setState(() {
            _model.isDataUploading = false;
            _model.uploadedLocalFiles = [];
            _model.uploadedFileUrls = [];
          });

          // onUploadProgressChange(false)
          await widget.onUploadProgressChange?.call(
            false,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color(0x4095A1AC),
              width: 2.0,
            ),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1000.0),
                ),
                child: const Icon(
                  Icons.replay,
                  color: Color(0x4095A1AC),
                  size: 50.0,
                ).animateOnActionTrigger(
                  animationsMap['iconOnActionTriggerAnimation']!,
                ),
              ),
              if (!_model.isUploadInProgress)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1000.0),
                  ),
                  child: const Icon(
                    Icons.upload,
                    color: Color(0x4095A1AC),
                    size: 50.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
