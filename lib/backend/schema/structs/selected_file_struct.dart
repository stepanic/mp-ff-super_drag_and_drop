// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedFileStruct extends FFFirebaseStruct {
  SelectedFileStruct({
    String? storagePath,
    String? filePath,
    List<int>? bytes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _storagePath = storagePath,
        _filePath = filePath,
        _bytes = bytes,
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

  // "bytes" field.
  List<int>? _bytes;
  List<int> get bytes => _bytes ?? const [];
  set bytes(List<int>? val) => _bytes = val;

  void updateBytes(Function(List<int>) updateFn) {
    updateFn(_bytes ??= []);
  }

  bool hasBytes() => _bytes != null;

  static SelectedFileStruct fromMap(Map<String, dynamic> data) =>
      SelectedFileStruct(
        storagePath: data['storagePath'] as String?,
        filePath: data['filePath'] as String?,
        bytes: getDataList(data['bytes']),
      );

  static SelectedFileStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'storagePath': _storagePath,
        'filePath': _filePath,
        'bytes': _bytes,
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
        'bytes': serializeParam(
          _bytes,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static SelectedFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedFileStruct(
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
        bytes: deserializeParam<int>(
          data['bytes'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'SelectedFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SelectedFileStruct &&
        storagePath == other.storagePath &&
        filePath == other.filePath &&
        listEquality.equals(bytes, other.bytes);
  }

  @override
  int get hashCode => const ListEquality().hash([storagePath, filePath, bytes]);
}

SelectedFileStruct createSelectedFileStruct({
  String? storagePath,
  String? filePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedFileStruct(
      storagePath: storagePath,
      filePath: filePath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedFileStruct? updateSelectedFileStruct(
  SelectedFileStruct? selectedFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedFileStructData(
  Map<String, dynamic> firestoreData,
  SelectedFileStruct? selectedFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedFile == null) {
    return;
  }
  if (selectedFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selectedFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedFileData =
      getSelectedFileFirestoreData(selectedFile, forFieldValue);
  final nestedData =
      selectedFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selectedFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedFileFirestoreData(
  SelectedFileStruct? selectedFile, [
  bool forFieldValue = false,
]) {
  if (selectedFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedFile.toMap());

  // Add any Firestore field values
  selectedFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedFileListFirestoreData(
  List<SelectedFileStruct>? selectedFiles,
) =>
    selectedFiles?.map((e) => getSelectedFileFirestoreData(e, true)).toList() ??
    [];
