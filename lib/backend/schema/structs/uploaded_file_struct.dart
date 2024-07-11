// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadedFileStruct extends FFFirebaseStruct {
  UploadedFileStruct({
    String? localPath,
    String? storagePath,
    String? storageDownloadUrl,
    List<int>? bytes,
    String? extension,
    String? mimeType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _localPath = localPath,
        _storagePath = storagePath,
        _storageDownloadUrl = storageDownloadUrl,
        _bytes = bytes,
        _extension = extension,
        _mimeType = mimeType,
        super(firestoreUtilData);

  // "localPath" field.
  String? _localPath;
  String get localPath => _localPath ?? '';
  set localPath(String? val) => _localPath = val;

  bool hasLocalPath() => _localPath != null;

  // "storagePath" field.
  String? _storagePath;
  String get storagePath => _storagePath ?? '';
  set storagePath(String? val) => _storagePath = val;

  bool hasStoragePath() => _storagePath != null;

  // "storageDownloadUrl" field.
  String? _storageDownloadUrl;
  String get storageDownloadUrl => _storageDownloadUrl ?? '';
  set storageDownloadUrl(String? val) => _storageDownloadUrl = val;

  bool hasStorageDownloadUrl() => _storageDownloadUrl != null;

  // "bytes" field.
  List<int>? _bytes;
  List<int> get bytes => _bytes ?? const [];
  set bytes(List<int>? val) => _bytes = val;

  void updateBytes(Function(List<int>) updateFn) {
    updateFn(_bytes ??= []);
  }

  bool hasBytes() => _bytes != null;

  // "extension" field.
  String? _extension;
  String get extension => _extension ?? '';
  set extension(String? val) => _extension = val;

  bool hasExtension() => _extension != null;

  // "mimeType" field.
  String? _mimeType;
  String get mimeType => _mimeType ?? '';
  set mimeType(String? val) => _mimeType = val;

  bool hasMimeType() => _mimeType != null;

  static UploadedFileStruct fromMap(Map<String, dynamic> data) =>
      UploadedFileStruct(
        localPath: data['localPath'] as String?,
        storagePath: data['storagePath'] as String?,
        storageDownloadUrl: data['storageDownloadUrl'] as String?,
        bytes: getDataList(data['bytes']),
        extension: data['extension'] as String?,
        mimeType: data['mimeType'] as String?,
      );

  static UploadedFileStruct? maybeFromMap(dynamic data) => data is Map
      ? UploadedFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'localPath': _localPath,
        'storagePath': _storagePath,
        'storageDownloadUrl': _storageDownloadUrl,
        'bytes': _bytes,
        'extension': _extension,
        'mimeType': _mimeType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localPath': serializeParam(
          _localPath,
          ParamType.String,
        ),
        'storagePath': serializeParam(
          _storagePath,
          ParamType.String,
        ),
        'storageDownloadUrl': serializeParam(
          _storageDownloadUrl,
          ParamType.String,
        ),
        'bytes': serializeParam(
          _bytes,
          ParamType.int,
          isList: true,
        ),
        'extension': serializeParam(
          _extension,
          ParamType.String,
        ),
        'mimeType': serializeParam(
          _mimeType,
          ParamType.String,
        ),
      }.withoutNulls;

  static UploadedFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UploadedFileStruct(
        localPath: deserializeParam(
          data['localPath'],
          ParamType.String,
          false,
        ),
        storagePath: deserializeParam(
          data['storagePath'],
          ParamType.String,
          false,
        ),
        storageDownloadUrl: deserializeParam(
          data['storageDownloadUrl'],
          ParamType.String,
          false,
        ),
        bytes: deserializeParam<int>(
          data['bytes'],
          ParamType.int,
          true,
        ),
        extension: deserializeParam(
          data['extension'],
          ParamType.String,
          false,
        ),
        mimeType: deserializeParam(
          data['mimeType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UploadedFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UploadedFileStruct &&
        localPath == other.localPath &&
        storagePath == other.storagePath &&
        storageDownloadUrl == other.storageDownloadUrl &&
        listEquality.equals(bytes, other.bytes) &&
        extension == other.extension &&
        mimeType == other.mimeType;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [localPath, storagePath, storageDownloadUrl, bytes, extension, mimeType]);
}

UploadedFileStruct createUploadedFileStruct({
  String? localPath,
  String? storagePath,
  String? storageDownloadUrl,
  String? extension,
  String? mimeType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadedFileStruct(
      localPath: localPath,
      storagePath: storagePath,
      storageDownloadUrl: storageDownloadUrl,
      extension: extension,
      mimeType: mimeType,
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
