import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/file_list_item_widget.dart';
import '/components/select_file_control_widget.dart';
import '/components/select_files_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
            'super_drag_and_drop.FF.hr',
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.selectFilesModel,
                  updateCallback: () => setState(() {}),
                  child: const SelectFilesWidget(),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  // upload local file to Storage and create Document in Firestore
                                  await action_blocks.createLocalFileOnFirebase(
                                    context,
                                    localFilePath: selectedFilePath,
                                    localFileBytes: selectedFileBytes,
                                  );
                                  // +1 uploaded
                                  _model.howManyUploadedFiles =
                                      _model.howManyUploadedFiles + 1;
                                  setState(() {});
                                },
                                onFilesDrop: (howManySelectedFiles) async {
                                  // set 0/N
                                  _model.howManySelectedFiles =
                                      howManySelectedFiles;
                                  _model.howManyUploadedFiles = 0;
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
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 35.0, 0.0, 0.0),
                                child: Container(
                                  width: 75.0,
                                  height: 75.0,
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.selectFileControlModel,
                                    updateCallback: () => setState(() {}),
                                    child: SelectFileControlWidget(
                                      onUploadProgressChange:
                                          (isUploadInProgress) async {
                                        // isUploadInProgress=Callback.isUploadInProgress
                                        _model.isUploadInProgress =
                                            isUploadInProgress;
                                        setState(() {});
                                      },
                                      onUploadDone:
                                          (fileNames, fileUrls) async {},
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
                  '${_model.howManyUploadedFiles.toString()}/${_model.howManySelectedFiles.toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: StreamBuilder<List<FilesRecord>>(
                        stream: queryFilesRecord(
                          queryBuilder: (filesRecord) => filesRecord
                              .where(
                                'read_allowed',
                                arrayContains: currentUserReference?.id,
                              )
                              .where(
                                'is_deleted',
                                isEqualTo: false,
                              )
                              .orderBy('created_at', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<FilesRecord> listViewFilesRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              128.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: listViewFilesRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewFilesRecord =
                                  listViewFilesRecordList[listViewIndex];
                              return FileListItemWidget(
                                key: Key(
                                    'Keyfgn_${listViewIndex}_of_${listViewFilesRecordList.length}'),
                                fileDoc: listViewFilesRecord,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    // Firebase Logout
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('LoginPage', context.mounted);
                  },
                  text: 'Logout',
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
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('FFDragNDrop');
                  },
                  text: 'Go to FF DragNDrop',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
