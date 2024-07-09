// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalFileStruct extends FFFirebaseStruct {
  LocalFileStruct({
    String? path,
    List<int>? bytes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _path = path,
        _bytes = bytes,
        super(firestoreUtilData);

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "bytes" field.
  List<int>? _bytes;
  List<int> get bytes => _bytes ?? const [];
  set bytes(List<int>? val) => _bytes = val;

  void updateBytes(Function(List<int>) updateFn) {
    updateFn(_bytes ??= []);
  }

  bool hasBytes() => _bytes != null;

  static LocalFileStruct fromMap(Map<String, dynamic> data) => LocalFileStruct(
        path: data['path'] as String?,
        bytes: getDataList(data['bytes']),
      );

  static LocalFileStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'path': _path,
        'bytes': _bytes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'bytes': serializeParam(
          _bytes,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static LocalFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocalFileStruct(
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        bytes: deserializeParam<int>(
          data['bytes'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'LocalFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LocalFileStruct &&
        path == other.path &&
        listEquality.equals(bytes, other.bytes);
  }

  @override
  int get hashCode => const ListEquality().hash([path, bytes]);
}

LocalFileStruct createLocalFileStruct({
  String? path,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocalFileStruct(
      path: path,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocalFileStruct? updateLocalFileStruct(
  LocalFileStruct? localFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    localFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocalFileStructData(
  Map<String, dynamic> firestoreData,
  LocalFileStruct? localFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (localFile == null) {
    return;
  }
  if (localFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && localFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final localFileData = getLocalFileFirestoreData(localFile, forFieldValue);
  final nestedData = localFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = localFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocalFileFirestoreData(
  LocalFileStruct? localFile, [
  bool forFieldValue = false,
]) {
  if (localFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(localFile.toMap());

  // Add any Firestore field values
  localFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocalFileListFirestoreData(
  List<LocalFileStruct>? localFiles,
) =>
    localFiles?.map((e) => getLocalFileFirestoreData(e, true)).toList() ?? [];
