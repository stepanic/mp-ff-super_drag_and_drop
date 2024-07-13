import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/uploaded_files_list_empty_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'select_and_upload_with_progress_model.dart';
export 'select_and_upload_with_progress_model.dart';

class SelectAndUploadWithProgressWidget extends StatefulWidget {
  const SelectAndUploadWithProgressWidget({super.key});

  @override
  State<SelectAndUploadWithProgressWidget> createState() =>
      _SelectAndUploadWithProgressWidgetState();
}

class _SelectAndUploadWithProgressWidgetState
    extends State<SelectAndUploadWithProgressWidget>
    with TickerProviderStateMixin {
  late SelectAndUploadWithProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectAndUploadWithProgressModel());

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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'select.and.upload.with.progress',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: 'Back',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          width: 256.0,
                          height: 256.0,
                          decoration: BoxDecoration(
                            color: _model.isOverSuperDragAndDrop
                                ? const Color(0xFFD4D4D4)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 3.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              if (!_model.isUploadInProgress)
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 60.0),
                                    child: Text(
                                      'Upload or drag & drop audio files.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0x4095A1AC),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              if (_model.isUploadInProgress)
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 80.0),
                                    child: Text(
                                      'Processing....',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0x4095A1AC),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 256.0,
                                height: 256.0,
                                child: custom_widgets.SuperDragAndDrop(
                                  width: 256.0,
                                  height: 256.0,
                                  onFileRead: (selectedFilePath,
                                      selectedFileBytes) async {
                                    // append to uploadedFiles
                                    _model
                                        .addToUploadedFiles(UploadedFileStruct(
                                      filePath: selectedFilePath,
                                      uploadStartedAt: getCurrentTimestamp,
                                    ));
                                    setState(() {});
                                    // upload async to Storage with Progress
                                    await actions
                                        .uploadSelectedFileWithProgress(
                                      SelectedFileStruct(
                                        storagePath:
                                            functions.getFirebaseStoragePath(
                                                selectedFilePath),
                                        filePath: selectedFilePath,
                                        bytes: selectedFileBytes,
                                      ),
                                      _model.uploadedFileNextIndex,
                                      (uploadProgress,
                                          uploadedFileIndex) async {},
                                      (uploadedFile,
                                          uploadedFileIndex) async {},
                                    );
                                    // uploadedFileNextIndex+=1;
                                    _model.uploadedFileNextIndex =
                                        _model.uploadedFileNextIndex + 1;
                                  },
                                  onFilesDrop: (howManySelectedFiles) async {
                                    // isUploadInProgress=true
                                    _model.isUploadInProgress = true;
                                    _model.howManySelectedFiles =
                                        _model.howManySelectedFiles +
                                            howManySelectedFiles;
                                    setState(() {});
                                  },
                                  onDropEnter: () async {
                                    // isOverSuperDragAndDrop=true
                                    _model.isOverSuperDragAndDrop = true;
                                    setState(() {});
                                  },
                                  onDropLeave: () async {
                                    // isOverSuperDragAndDrop=false
                                    _model.isOverSuperDragAndDrop = false;
                                    setState(() {});
                                  },
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 35.0, 0.0, 0.0),
                                  child: Container(
                                    width: 75.0,
                                    height: 75.0,
                                    decoration: const BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          // custom select files
                                          _model.selectedFiles = await actions
                                              .selectFilesWithAllowedExtensions(
                                            FFAppConstants
                                                    .UploadAllowedExtensions
                                                .toList(),
                                            true,
                                          );
                                          if (_model.selectedFiles != null &&
                                              (_model.selectedFiles)!
                                                  .isNotEmpty) {
                                            // ii=0; howManySelectedFiles += selectedFiles.length;
                                            _model.howManySelectedFiles = _model
                                                    .howManySelectedFiles +
                                                _model.selectedFiles!.length;
                                            _model.ii = 0;
                                            _model.isUploadInProgress = true;
                                            setState(() {});
                                            // rotate progress icon
                                            if (animationsMap[
                                                    'iconOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'iconOnActionTriggerAnimation']!
                                                  .controller
                                                  .repeat();
                                            }
                                            while (_model.ii <
                                                _model.selectedFiles!.length) {
                                              // append to uploadedFiles
                                              _model.addToUploadedFiles(
                                                  UploadedFileStruct(
                                                filePath:
                                                    (_model.selectedFiles?[
                                                            _model.ii])
                                                        ?.filePath,
                                                uploadStartedAt:
                                                    getCurrentTimestamp,
                                              ));
                                              setState(() {});
                                              // selectedFile[i] to Firebase Storage
                                              unawaited(
                                                () async {
                                                  await actions
                                                      .uploadSelectedFileWithProgress(
                                                    _model.selectedFiles![
                                                        _model.ii],
                                                    _model
                                                        .uploadedFileNextIndex,
                                                    (uploadProgress,
                                                        uploadedFileIndex) async {
                                                      // uploadedFiles[uploadedFileIndex]=uploadProgress
                                                      _model
                                                          .updateUploadedFilesAtIndex(
                                                        uploadedFileIndex,
                                                        (e) => e
                                                          ..uploadProgress =
                                                              uploadProgress,
                                                      );
                                                      setState(() {});
                                                    },
                                                    (uploadedFile,
                                                        uploadedFileIndex) async {
                                                      // uploadedFiles[uploadedFileIndex]=uploadedFile
                                                      _model
                                                          .updateUploadedFilesAtIndex(
                                                        uploadedFileIndex,
                                                        (e) => e
                                                          ..storagePath =
                                                              uploadedFile
                                                                  .storagePath
                                                          ..storageDownloadUrl =
                                                              uploadedFile
                                                                  .storageDownloadUrl
                                                          ..sizeInBytes =
                                                              uploadedFile
                                                                  .sizeInBytes
                                                          ..uploadFinishedAt =
                                                              getCurrentTimestamp,
                                                      );
                                                      _model.howManyUploadedFiles =
                                                          _model.howManyUploadedFiles +
                                                              1;
                                                      setState(() {});
                                                      if (_model
                                                              .howManyUploadedFiles ==
                                                          _model
                                                              .howManySelectedFiles) {
                                                        // isUploadInProgress=false;
                                                        _model.isUploadInProgress =
                                                            false;
                                                        setState(() {});
                                                        // sto rotating progress icon
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'iconOnActionTriggerAnimation']!
                                                              .controller
                                                              .stop();
                                                        }
                                                      }
                                                    },
                                                  );
                                                }(),
                                              );
                                              // ii+=1; uploadedFileNextIndex+=1;
                                              _model.ii = _model.ii + 1;
                                              _model.uploadedFileNextIndex =
                                                  _model.uploadedFileNextIndex +
                                                      1;
                                            }
                                          } else {
                                            // show error message
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Files not selected',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1000.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: const Color(0x4095A1AC),
                                              width: 2.0,
                                            ),
                                          ),
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Stack(
                                            children: [
                                              AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 100),
                                                curve: Curves.easeIn,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1000.0),
                                                ),
                                                child: const Icon(
                                                  Icons.replay,
                                                  color: Color(0x4095A1AC),
                                                  size: 50.0,
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'iconOnActionTriggerAnimation']!,
                                                ),
                                              ),
                                              if (!_model.isUploadInProgress)
                                                AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.easeIn,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1000.0),
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
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${valueOrDefault<String>(
                      _model.howManyUploadedFiles.toString(),
                      '0',
                    )}/${_model.howManySelectedFiles.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final uploadedFilesRecentList =
                            _model.uploadedFiles.toList();
                        if (uploadedFilesRecentList.isEmpty) {
                          return const UploadedFilesListEmptyPlaceholderWidget();
                        }

                        return Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children:
                              List.generate(uploadedFilesRecentList.length,
                                  (uploadedFilesRecentListIndex) {
                            final uploadedFilesRecentListItem =
                                uploadedFilesRecentList[
                                    uploadedFilesRecentListIndex];
                            return Container(
                              constraints: const BoxConstraints(
                                maxWidth: 256.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        uploadedFilesRecentListItem.filePath,
                                        'N/A',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      (int? sizeInBytes) {
                                        return sizeInBytes != null
                                            ? "${(sizeInBytes / 1024 / 1024).toStringAsFixed(2)}MB"
                                            : "N/A";
                                      }(uploadedFilesRecentListItem
                                          .sizeInBytes),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    if ((uploadedFilesRecentListItem
                                                .storageDownloadUrl !=
                                            '') &&
                                        false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          // launch URL
                                          await actions.launchUrl(
                                            valueOrDefault<String>(
                                              _model
                                                  .uploadedFiles[
                                                      uploadedFilesRecentListIndex]
                                                  .storageDownloadUrl,
                                              'N/A',
                                            ),
                                          );
                                        },
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model
                                                .uploadedFiles[
                                                    uploadedFilesRecentListIndex]
                                                .storageDownloadUrl,
                                            'N/A',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    if (uploadedFilesRecentListItem
                                            .storageDownloadUrl ==
                                        '')
                                      LinearPercentIndicator(
                                        percent: uploadedFilesRecentListItem
                                            .uploadProgress,
                                        lineHeight: 25.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Text(
                                          (double progress) {
                                            return "${(progress * 100).toStringAsFixed(0)}%";
                                          }(uploadedFilesRecentListItem
                                              .uploadProgress),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
