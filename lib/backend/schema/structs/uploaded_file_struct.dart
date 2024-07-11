// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadedFileStruct extends FFFirebaseStruct {
  UploadedFileStruct({
    String? localName,
    String? storageName,
    List<int>? bytes,
    String? extension,
    String? mimeType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _localName = localName,
        _storageName = storageName,
        _bytes = bytes,
        _extension = extension,
        _mimeType = mimeType,
        super(firestoreUtilData);

  // "localName" field.
  String? _localName;
  String get localName => _localName ?? '';
  set localName(String? val) => _localName = val;

  bool hasLocalName() => _localName != null;

  // "storageName" field.
  String? _storageName;
  String get storageName => _storageName ?? '';
  set storageName(String? val) => _storageName = val;

  bool hasStorageName() => _storageName != null;

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
        localName: data['localName'] as String?,
        storageName: data['storageName'] as String?,
        bytes: getDataList(data['bytes']),
        extension: data['extension'] as String?,
        mimeType: data['mimeType'] as String?,
      );

  static UploadedFileStruct? maybeFromMap(dynamic data) => data is Map
      ? UploadedFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'localName': _localName,
        'storageName': _storageName,
        'bytes': _bytes,
        'extension': _extension,
        'mimeType': _mimeType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localName': serializeParam(
          _localName,
          ParamType.String,
        ),
        'storageName': serializeParam(
          _storageName,
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
        localName: deserializeParam(
          data['localName'],
          ParamType.String,
          false,
        ),
        storageName: deserializeParam(
          data['storageName'],
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
        localName == other.localName &&
        storageName == other.storageName &&
        listEquality.equals(bytes, other.bytes) &&
        extension == other.extension &&
        mimeType == other.mimeType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([localName, storageName, bytes, extension, mimeType]);
}

UploadedFileStruct createUploadedFileStruct({
  String? localName,
  String? storageName,
  String? extension,
  String? mimeType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadedFileStruct(
      localName: localName,
      storageName: storageName,
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
