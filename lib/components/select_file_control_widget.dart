import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'select_file_control_model.dart';
export 'select_file_control_model.dart';

class SelectFileControlWidget extends StatefulWidget {
  const SelectFileControlWidget({super.key});

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
            duration: 1000.0.ms,
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
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // isProgressVisible=true
          _model.isProgressVisible = true;
          setState(() {});
          // start rotating progress icon
          if (animationsMap['iconOnActionTriggerAnimation'] != null) {
            animationsMap['iconOnActionTriggerAnimation']!.controller
              ..reset()
              ..repeat();
          }
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
          // stop rotating progress icon
          if (animationsMap['iconOnActionTriggerAnimation'] != null) {
            animationsMap['iconOnActionTriggerAnimation']!.controller.stop();
          }
          // isProgressVisible=false
          _model.isProgressVisible = true;
          setState(() {});
          // update page

          _model.updatePage(() {});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_model.isProgressVisible)
                const Icon(
                  Icons.upload,
                  color: Color(0x4095A1AC),
                  size: 50.0,
                ),
              if (_model.isProgressVisible)
                const Icon(
                  Icons.replay,
                  color: Color(0x4095A1AC),
                  size: 50.0,
                ).animateOnActionTrigger(
                  animationsMap['iconOnActionTriggerAnimation']!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
