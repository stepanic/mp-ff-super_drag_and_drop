import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilesRecord extends FirestoreRecord {
  FilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "file_url" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "file_name" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  bool hasFileName() => _fileName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "read_allowed" field.
  List<String>? _readAllowed;
  List<String> get readAllowed => _readAllowed ?? const [];
  bool hasReadAllowed() => _readAllowed != null;

  // "write_allowed" field.
  List<String>? _writeAllowed;
  List<String> get writeAllowed => _writeAllowed ?? const [];
  bool hasWriteAllowed() => _writeAllowed != null;

  // "file_type" field.
  FileType? _fileType;
  FileType? get fileType => _fileType;
  bool hasFileType() => _fileType != null;

  void _initializeFields() {
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _fileUrl = snapshotData['file_url'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _fileName = snapshotData['file_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _readAllowed = getDataList(snapshotData['read_allowed']);
    _writeAllowed = getDataList(snapshotData['write_allowed']);
    _fileType = deserializeEnum<FileType>(snapshotData['file_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('files');

  static Stream<FilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FilesRecord.fromSnapshot(s));

  static Future<FilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FilesRecord.fromSnapshot(s));

  static FilesRecord fromSnapshot(DocumentSnapshot snapshot) => FilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFilesRecordData({
  DocumentReference? ownerRef,
  String? fileUrl,
  bool? isDeleted,
  String? fileName,
  DateTime? createdAt,
  FileType? fileType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner_ref': ownerRef,
      'file_url': fileUrl,
      'is_deleted': isDeleted,
      'file_name': fileName,
      'created_at': createdAt,
      'file_type': fileType,
    }.withoutNulls,
  );

  return firestoreData;
}

class FilesRecordDocumentEquality implements Equality<FilesRecord> {
  const FilesRecordDocumentEquality();

  @override
  bool equals(FilesRecord? e1, FilesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ownerRef == e2?.ownerRef &&
        e1?.fileUrl == e2?.fileUrl &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.fileName == e2?.fileName &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.readAllowed, e2?.readAllowed) &&
        listEquality.equals(e1?.writeAllowed, e2?.writeAllowed) &&
        e1?.fileType == e2?.fileType;
  }

  @override
  int hash(FilesRecord? e) => const ListEquality().hash([
        e?.ownerRef,
        e?.fileUrl,
        e?.isDeleted,
        e?.fileName,
        e?.createdAt,
        e?.readAllowed,
        e?.writeAllowed,
        e?.fileType
      ]);

  @override
  bool isValidKey(Object? o) => o is FilesRecord;
}
