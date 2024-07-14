// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadedFileStruct extends FFFirebaseStruct {
  UploadedFileStruct({
    String? storagePath,
    String? filePath,
    DateTime? uploadStartedAt,
    double? uploadProgress,
    String? storageDownloadUrl,
    int? sizeInBytes,
    DateTime? uploadFinishedAt,
    bool? isUploadFinished,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _storagePath = storagePath,
        _filePath = filePath,
        _uploadStartedAt = uploadStartedAt,
        _uploadProgress = uploadProgress,
        _storageDownloadUrl = storageDownloadUrl,
        _sizeInBytes = sizeInBytes,
        _uploadFinishedAt = uploadFinishedAt,
        _isUploadFinished = isUploadFinished,
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

  // "uploadStartedAt" field.
  DateTime? _uploadStartedAt;
  DateTime? get uploadStartedAt => _uploadStartedAt;
  set uploadStartedAt(DateTime? val) => _uploadStartedAt = val;

  bool hasUploadStartedAt() => _uploadStartedAt != null;

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

  // "sizeInBytes" field.
  int? _sizeInBytes;
  int get sizeInBytes => _sizeInBytes ?? 0;
  set sizeInBytes(int? val) => _sizeInBytes = val;

  void incrementSizeInBytes(int amount) => sizeInBytes = sizeInBytes + amount;

  bool hasSizeInBytes() => _sizeInBytes != null;

  // "uploadFinishedAt" field.
  DateTime? _uploadFinishedAt;
  DateTime? get uploadFinishedAt => _uploadFinishedAt;
  set uploadFinishedAt(DateTime? val) => _uploadFinishedAt = val;

  bool hasUploadFinishedAt() => _uploadFinishedAt != null;

  // "isUploadFinished" field.
  bool? _isUploadFinished;
  bool get isUploadFinished => _isUploadFinished ?? false;
  set isUploadFinished(bool? val) => _isUploadFinished = val;

  bool hasIsUploadFinished() => _isUploadFinished != null;

  static UploadedFileStruct fromMap(Map<String, dynamic> data) =>
      UploadedFileStruct(
        storagePath: data['storagePath'] as String?,
        filePath: data['filePath'] as String?,
        uploadStartedAt: data['uploadStartedAt'] as DateTime?,
        uploadProgress: castToType<double>(data['uploadProgress']),
        storageDownloadUrl: data['storageDownloadUrl'] as String?,
        sizeInBytes: castToType<int>(data['sizeInBytes']),
        uploadFinishedAt: data['uploadFinishedAt'] as DateTime?,
        isUploadFinished: data['isUploadFinished'] as bool?,
      );

  static UploadedFileStruct? maybeFromMap(dynamic data) => data is Map
      ? UploadedFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'storagePath': _storagePath,
        'filePath': _filePath,
        'uploadStartedAt': _uploadStartedAt,
        'uploadProgress': _uploadProgress,
        'storageDownloadUrl': _storageDownloadUrl,
        'sizeInBytes': _sizeInBytes,
        'uploadFinishedAt': _uploadFinishedAt,
        'isUploadFinished': _isUploadFinished,
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
        'uploadStartedAt': serializeParam(
          _uploadStartedAt,
          ParamType.DateTime,
        ),
        'uploadProgress': serializeParam(
          _uploadProgress,
          ParamType.double,
        ),
        'storageDownloadUrl': serializeParam(
          _storageDownloadUrl,
          ParamType.String,
        ),
        'sizeInBytes': serializeParam(
          _sizeInBytes,
          ParamType.int,
        ),
        'uploadFinishedAt': serializeParam(
          _uploadFinishedAt,
          ParamType.DateTime,
        ),
        'isUploadFinished': serializeParam(
          _isUploadFinished,
          ParamType.bool,
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
        uploadStartedAt: deserializeParam(
          data['uploadStartedAt'],
          ParamType.DateTime,
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
        sizeInBytes: deserializeParam(
          data['sizeInBytes'],
          ParamType.int,
          false,
        ),
        uploadFinishedAt: deserializeParam(
          data['uploadFinishedAt'],
          ParamType.DateTime,
          false,
        ),
        isUploadFinished: deserializeParam(
          data['isUploadFinished'],
          ParamType.bool,
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
        uploadStartedAt == other.uploadStartedAt &&
        uploadProgress == other.uploadProgress &&
        storageDownloadUrl == other.storageDownloadUrl &&
        sizeInBytes == other.sizeInBytes &&
        uploadFinishedAt == other.uploadFinishedAt &&
        isUploadFinished == other.isUploadFinished;
  }

  @override
  int get hashCode => const ListEquality().hash([
        storagePath,
        filePath,
        uploadStartedAt,
        uploadProgress,
        storageDownloadUrl,
        sizeInBytes,
        uploadFinishedAt,
        isUploadFinished
      ]);
}

UploadedFileStruct createUploadedFileStruct({
  String? storagePath,
  String? filePath,
  DateTime? uploadStartedAt,
  double? uploadProgress,
  String? storageDownloadUrl,
  int? sizeInBytes,
  DateTime? uploadFinishedAt,
  bool? isUploadFinished,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadedFileStruct(
      storagePath: storagePath,
      filePath: filePath,
      uploadStartedAt: uploadStartedAt,
      uploadProgress: uploadProgress,
      storageDownloadUrl: storageDownloadUrl,
      sizeInBytes: sizeInBytes,
      uploadFinishedAt: uploadFinishedAt,
      isUploadFinished: isUploadFinished,
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
