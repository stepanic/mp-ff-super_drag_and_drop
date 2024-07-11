// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UploadingFileStruct extends FFFirebaseStruct {
  UploadingFileStruct({
    String? localName,
    double? progress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _localName = localName,
        _progress = progress,
        super(firestoreUtilData);

  // "localName" field.
  String? _localName;
  String get localName => _localName ?? '';
  set localName(String? val) => _localName = val;

  bool hasLocalName() => _localName != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;

  void incrementProgress(double amount) => progress = progress + amount;

  bool hasProgress() => _progress != null;

  static UploadingFileStruct fromMap(Map<String, dynamic> data) =>
      UploadingFileStruct(
        localName: data['localName'] as String?,
        progress: castToType<double>(data['progress']),
      );

  static UploadingFileStruct? maybeFromMap(dynamic data) => data is Map
      ? UploadingFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'localName': _localName,
        'progress': _progress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localName': serializeParam(
          _localName,
          ParamType.String,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
      }.withoutNulls;

  static UploadingFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UploadingFileStruct(
        localName: deserializeParam(
          data['localName'],
          ParamType.String,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UploadingFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UploadingFileStruct &&
        localName == other.localName &&
        progress == other.progress;
  }

  @override
  int get hashCode => const ListEquality().hash([localName, progress]);
}

UploadingFileStruct createUploadingFileStruct({
  String? localName,
  double? progress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadingFileStruct(
      localName: localName,
      progress: progress,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UploadingFileStruct? updateUploadingFileStruct(
  UploadingFileStruct? uploadingFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    uploadingFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUploadingFileStructData(
  Map<String, dynamic> firestoreData,
  UploadingFileStruct? uploadingFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (uploadingFile == null) {
    return;
  }
  if (uploadingFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && uploadingFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final uploadingFileData =
      getUploadingFileFirestoreData(uploadingFile, forFieldValue);
  final nestedData =
      uploadingFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = uploadingFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUploadingFileFirestoreData(
  UploadingFileStruct? uploadingFile, [
  bool forFieldValue = false,
]) {
  if (uploadingFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(uploadingFile.toMap());

  // Add any Firestore field values
  uploadingFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUploadingFileListFirestoreData(
  List<UploadingFileStruct>? uploadingFiles,
) =>
    uploadingFiles
        ?.map((e) => getUploadingFileFirestoreData(e, true))
        .toList() ??
    [];
