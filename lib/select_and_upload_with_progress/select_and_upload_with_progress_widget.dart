import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/uploading_files_list_empty_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
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
    extends State<SelectAndUploadWithProgressWidget> {
  late SelectAndUploadWithProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectAndUploadWithProgressModel());

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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    // custom select files
                    _model.selectedFiles =
                        await actions.selectFilesWithAllowedExtensions(
                      FFAppConstants.UploadAllowedExtensions.toList(),
                      true,
                    );
                    if (_model.selectedFiles != null &&
                        (_model.selectedFiles)!.isNotEmpty) {
                      // i=0; uploadingFiles=[]; uploadedFiles=[];
                      _model.ii = 0;
                      _model.uploadingFiles = [];
                      _model.uploadedFiles = [];
                      while (_model.ii < _model.selectedFiles!.length) {
                        // init uploadingFiles
                        _model.addToUploadingFiles(UploadingFileStruct(
                          localName: valueOrDefault<String>(
                            (_model.selectedFiles?[_model.ii])?.filePath,
                            'N/A',
                          ),
                          progress: 0.0,
                        ));
                        setState(() {});
                        // init uploadedFiles
                        _model.addToUploadedFiles(UploadedFileStruct(
                          localPath:
                              (_model.selectedFiles?[_model.ii])?.filePath,
                        ));
                        setState(() {});
                        // selectedFile[i] to Firebase Storage
                        await actions.uploadSelectedFileWithProgress(
                          _model.selectedFiles![_model.ii],
                          _model.ii,
                          (uploadProgress, selectedFileIndex) async {
                            // uploadingFiles[selectedFileIndex]=uploadProgress
                            _model.updateUploadingFilesAtIndex(
                              selectedFileIndex,
                              (e) => e..progress = uploadProgress,
                            );
                            setState(() {});
                          },
                          (uploadedFile, selectedFileIndex) async {
                            // uploadedFiles[selectedFileIndex]=uploadedFile
                            _model.insertAtIndexInUploadedFiles(
                                selectedFileIndex, uploadedFile);
                            setState(() {});
                          },
                        );
                        // i += 1;
                        _model.ii = _model.ii + 1;
                      }
                    } else {
                      // show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Files not selected',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: 'Select Files & Upload with Progress',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final uploadingFilesList = _model.uploadingFiles.toList();
                      if (uploadingFilesList.isEmpty) {
                        return const UploadingFilesListEmptyPlaceholderWidget();
                      }

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(uploadingFilesList.length,
                            (uploadingFilesListIndex) {
                          final uploadingFilesListItem =
                              uploadingFilesList[uploadingFilesListIndex];
                          return Container(
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
                                    uploadingFilesListItem.localName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  LinearPercentIndicator(
                                    percent: uploadingFilesListItem.progress,
                                    lineHeight: 25.0,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    center: Text(
                                      (double progress) {
                                        return "${progress * 100}%";
                                      }(uploadingFilesListItem.progress),
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
                        }).divide(const SizedBox(height: 12.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
