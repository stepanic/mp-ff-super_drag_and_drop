// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UploadedFileStruct extends FFFirebaseStruct {
  UploadedFileStruct({
    String? storagePath,
    String? filePath,
    double? uploadProgress,
    String? storageDownloadUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _storagePath = storagePath,
        _filePath = filePath,
        _uploadProgress = uploadProgress,
        _storageDownloadUrl = storageDownloadUrl,
        super(firestoreUtilData);

  // "storagePath" field.
  String? _storagePath;
  String get storagePath => _storagePath ?? '';
  set storagePath(String? val) => _storagePath = val;

  bool hasStoragePath() => _storagePath != null;

  // "filePath" field.
  String? _filePath;
  String get filePath => _filePath ?? '';
  set filePath(String? val) => _filePath = val;

  bool hasFilePath() => _filePath != null;

  // "uploadProgress" field.
  double? _uploadProgress;
  double get uploadProgress => _uploadProgress ?? 0.0;
  set uploadProgress(double? val) => _uploadProgress = val;

  void incrementUploadProgress(double amount) =>
      uploadProgress = uploadProgress + amount;

  bool hasUploadProgress() => _uploadProgress != null;

  // "storageDownloadUrl" field.
  String? _storageDownloadUrl;
  String get storageDownloadUrl => _storageDownloadUrl ?? '';
  set storageDownloadUrl(String? val) => _storageDownloadUrl = val;

  bool hasStorageDownloadUrl() => _storageDownloadUrl != null;

  static UploadedFileStruct fromMap(Map<String, dynamic> data) =>
      UploadedFileStruct(
        storagePath: data['storagePath'] as String?,
        filePath: data['filePath'] as String?,
        uploadProgress: castToType<double>(data['uploadProgress']),
        storageDownloadUrl: data['storageDownloadUrl'] as String?,
      );

  static UploadedFileStruct? maybeFromMap(dynamic data) => data is Map
      ? UploadedFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'storagePath': _storagePath,
        'filePath': _filePath,
        'uploadProgress': _uploadProgress,
        'storageDownloadUrl': _storageDownloadUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'storagePath': serializeParam(
          _storagePath,
          ParamType.String,
        ),
        'filePath': serializeParam(
          _filePath,
          ParamType.String,
        ),
        'uploadProgress': serializeParam(
          _uploadProgress,
          ParamType.double,
        ),
        'storageDownloadUrl': serializeParam(
          _storageDownloadUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static UploadedFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UploadedFileStruct(
        storagePath: deserializeParam(
          data['storagePath'],
          ParamType.String,
          false,
        ),
        filePath: deserializeParam(
          data['filePath'],
          ParamType.String,
          false,
        ),
        uploadProgress: deserializeParam(
          data['uploadProgress'],
          ParamType.double,
          false,
        ),
        storageDownloadUrl: deserializeParam(
          data['storageDownloadUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UploadedFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UploadedFileStruct &&
        storagePath == other.storagePath &&
        filePath == other.filePath &&
        uploadProgress == other.uploadProgress &&
        storageDownloadUrl == other.storageDownloadUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([storagePath, filePath, uploadProgress, storageDownloadUrl]);
}

UploadedFileStruct createUploadedFileStruct({
  String? storagePath,
  String? filePath,
  double? uploadProgress,
  String? storageDownloadUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadedFileStruct(
      storagePath: storagePath,
      filePath: filePath,
      uploadProgress: uploadProgress,
      storageDownloadUrl: storageDownloadUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UploadedFileStruct? updateUploadedFileStruct(
  UploadedFileStruct? uploadedFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    uploadedFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUploadedFileStructData(
  Map<String, dynamic> firestoreData,
  UploadedFileStruct? uploadedFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (uploadedFile == null) {
    return;
  }
  if (uploadedFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && uploadedFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final uploadedFileData =
      getUploadedFileFirestoreData(uploadedFile, forFieldValue);
  final nestedData =
      uploadedFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = uploadedFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUploadedFileFirestoreData(
  UploadedFileStruct? uploadedFile, [
  bool forFieldValue = false,
]) {
  if (uploadedFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(uploadedFile.toMap());

  // Add any Firestore field values
  uploadedFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUploadedFileListFirestoreData(
  List<UploadedFileStruct>? uploadedFiles,
) =>
    uploadedFiles?.map((e) => getUploadedFileFirestoreData(e, true)).toList() ??
    [];
