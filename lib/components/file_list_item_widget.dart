import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'file_list_item_model.dart';
export 'file_list_item_model.dart';

class FileListItemWidget extends StatefulWidget {
  const FileListItemWidget({
    super.key,
    required this.fileDoc,
  });

  final FilesRecord? fileDoc;

  @override
  State<FileListItemWidget> createState() => _FileListItemWidgetState();
}

class _FileListItemWidgetState extends State<FileListItemWidget> {
  late FileListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FileListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.fileDoc?.fileName,
                  'N/A',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.fileDoc?.fileType?.name,
                  'N/A',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.delete,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  // is_deleted=true

                  await widget.fileDoc!.reference.update(createFilesRecordData(
                    isDeleted: true,
                  ));
                },
              ),
            ],
          ),
          if (widget.fileDoc?.fileType == FileType.AUDIO)
            Container(
              decoration: const BoxDecoration(),
              child: FlutterFlowAudioPlayer(
                audio: Audio.network(
                  functions.fileUrlToAudioPath(
                      functions.imageKitAsFirebaseStorageProxy(
                          widget.fileDoc!.fileUrl,
                          FFAppConstants.FirebaseStoragePrefix,
                          FFAppConstants.ImageKitPrefix))!,
                  metas: Metas(
                    id: 'sample3.mp3-1314cbec',
                    title: widget.fileDoc?.fileName,
                  ),
                ),
                titleTextStyle:
                    FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                playbackDurationTextStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                playbackButtonColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).alternate,
                elevation: 4.0,
                playInBackground: PlayInBackground.enabled,
              ),
            ),
        ],
      ),
    );
  }
}
